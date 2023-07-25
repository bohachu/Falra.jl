include("../src/DispatchGithubAction.jl")
using DotEnv

DotEnv.config()
repo_url = "https://github.com/bohachu/bak_Falra.jl.git"
workflow_yml_filename = "main2.yml"

println(dispatch_github_action(ENV["GITHUB_ACCESS_TOKEN"], repo_url, workflow_yml_filename))