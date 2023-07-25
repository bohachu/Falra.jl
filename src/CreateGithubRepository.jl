using HTTP
using JSON

function create_github_repository(token::String, repo_name::String, private::Bool=false)
    url = "https://api.github.com/user/repos"
    
    headers = Dict(
        "Authorization" => "token $token",
        "Accept" => "application/vnd.github.v3+json",
    )

    data = Dict(
        "name" => repo_name,
        "private" => private,
    )

    response = HTTP.request("POST", url, headers, JSON.json(data))
    
    if response.status == 201
        println("Successfully created the repository $repo_name")
    else
        error("Failed to create the repository: $(String(response.body))")
    end
end