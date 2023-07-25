using HTTP
using JSON

function get_api_url_headers(token, repo_url)
    repo_api_url = get_repo_api_url(repo_url)
    headers = get_headers_with_authorization_and_version(token)
    return headers, repo_api_url
end

function get_headers_with_authorization_and_version(token)
    headers = get_headers_with_authorization(token)
    headers["Accept"] = "application/vnd.github+json"
    headers["X-GitHub-Api-Version"] = "2022-11-28"
    return headers
end

function get_headers_with_authorization(token)
    return Dict("Authorization" => "token $token")
end

function get_repo_api_url(url)
    if url[end-3:end] == ".git"
        url = url[1:end-4]
    end
    return replace(url, "https://github.com" => "https://api.github.com/repos")
end

function dispatch_github_action(token, repo_url, workflow_yml_filename, event_type=nothing, client_payload=nothing)
    headers, repo_api_url = get_api_url_headers(token, repo_url)
    dispatch_url = "$repo_api_url/actions/workflows/$workflow_yml_filename/dispatches"

    data = Dict(
        "ref" => "main",
        "inputs" => Dict()
    )

    if event_type != nothing
        data["inputs"]["event_type"] = event_type
    end
    if client_payload != nothing
        data["inputs"]["client_payload"] = client_payload
    end

    response = HTTP.request("POST", dispatch_url, headers, JSON.json(data))
    return String(response.body)
end
