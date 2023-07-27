include("../src/UploadGithub.jl")
using DotEnv

DotEnv.config()
repo = "bohachu/"*"test123"
files = Dict(
    "/Users/chialolee/main.yml" => ".github/workflows/main.yml",
    "/Users/chialolee/Vscode/Falra.jl/src/main.jl" => "src/main.jl"
)
commit_message = "ok"
user_directory = "./users/falra_botrun_ai"
upload_github(user_directory, ENV["GITHUB_ACCESS_TOKEN"], repo, files, commit_message)

