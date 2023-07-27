using HTTP
using JSON
function create_github_repository(token::String, user_name, repo_name::String, private::Bool=false)
    try
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
    catch e
        println("exception:",e)
    end
end
