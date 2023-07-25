using HTTP
using JSON
using FilePaths
using Base64

function get_repo_api_url(url::String)
    if endswith(url, ".git")
        url = url[1:end-4]
    end
    return replace(url, "https://github.com" => "https://api.github.com/repos")
end

function get_headers_with_authorization_and_version(token::String)
    headers = get_headers_with_authorization(token)
    headers["Accept"] = "application/vnd.github+json"
    headers["X-GitHub-Api-Version"] = "2022-11-28"
    return headers
end

function get_workflow_runs(token::String, repo_url::String, workflow_yml_filename::String, per_page::Int=1)
    repo_api_url = get_repo_api_url(repo_url)
    headers = get_headers_with_authorization_and_version(token)
    response = HTTP.request("GET", "$repo_api_url/actions/workflows/$workflow_yml_filename/runs?per_page=$per_page", headers)
    return JSON.parse(String(response.body))
end

function get_run_status(token::String, repo_url::String, run_id::Int)
    repo_api_url = get_repo_api_url(repo_url)
    headers = get_headers_with_authorization_and_version(token)
    response = HTTP.request("GET", "$repo_api_url/actions/runs/$run_id", headers)
    return JSON.parse(String(response.body))
end

function get_latest_artifacts_url(token::String, repo_url::String, workflow_yml_filename::String)
    workflow_runs = get_workflow_runs(token, repo_url, workflow_yml_filename, 1)
    latest_run_id = workflow_runs["workflow_runs"][1]["id"]
    latest_run_status = get_run_status(token, repo_url, latest_run_id)
    latest_artifacts_url = latest_run_status["artifacts_url"]
    return latest_artifacts_url
end

function get_headers_with_authorization(token::String)
    return Dict("Authorization" => "token $token")
end

function download_latest_artifacts(token::String, repo_url::String, workflow_yml_filename::String, output_path::String)
    latest_artifacts_url = get_latest_artifacts_url(token, repo_url, workflow_yml_filename)
    headers = get_headers_with_authorization(token)
    artifacts_response = HTTP.request("GET", latest_artifacts_url, headers)
    artifacts = JSON.parse(String(artifacts_response.body))

    if isempty(artifacts["artifacts"])
        error("No artifacts found for the specified workflow.")
    end

    artifact_download_url = artifacts["artifacts"][1]["archive_download_url"]
    file_name = artifacts["artifacts"][1]["name"]
    download_response = HTTP.request("GET", artifact_download_url, headers)

    if download_response.status != 200
        error("Failed to download the artifact.")
    end

    mkpath(dirname(output_path))
    open(output_path, "w") do f
        write(f, download_response.body)
    end

    println("Artifacts downloaded to: $output_path")
    return output_path
end