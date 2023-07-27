include("../src/UploadGithub.jl")
using DotEnv

DotEnv.config()
repo = "bohachu/"*"test"
files = Dict(
    "/Users/chialolee/main.yml" => ".github/workflows/main.yml",
    "/Users/chialolee/Vscode/Falra.jl/src/main.jl" => "src/main.jl"
)
commit_message = "ok"
upload_github(ENV["GITHUB_ACCESS_TOKEN"], repo, files, commit_message)

