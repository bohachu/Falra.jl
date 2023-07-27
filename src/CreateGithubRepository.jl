using HTTP
using JSON

function check_github_repository_exists(token::String, repo_name::String)
    url = "https://api.github.com/repos/<your_username>/$repo_name"

    headers = Dict(
        "Authorization" => "token $token",
        "Accept" => "application/vnd.github.v3+json",
    )

    response = HTTP.request("GET", url, headers)

    return response.status == 200
end

function create_github_repository(token::String, repo_name::String, private::Bool=false)
    if check_github_repository_exists(token, repo_name)
        println("The repository $repo_name already exists.")
        return
    end

    url = "https://api.github.com/user/repos"

    headers = Dict(
        "Authorization" => "token $token",
        "Accept" => "application/vnd.github.v3+json",
    )

    data = Dict(
        "name" => repo_name,
        "private" => private,
        "auto_init" => true,
        "default_branch" => "main"
    )

    response = HTTP.request("POST", url, headers, JSON.json(data))

    if response.status == 201
        println("Successfully created the repository $repo_name")
    else
        println("Failed to create the repository: $(String(response.body))")
    end
end
