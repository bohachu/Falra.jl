include("../src/DownloadLatestArtifacts.jl")
using DotEnv

DotEnv.config()
repo_url = "https://github.com/bohachu/bak_Falra.jl.git"
workflow_yml_filename = "main2.yml"
output_path="./data/artifact.zip"

println(download_latest_artifacts(ENV["GITHUB_ACCESS_TOKEN"], repo_url, workflow_yml_filename, output_path))