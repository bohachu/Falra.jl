include("../src/CreateGithubRepository.jl")
using DotEnv

DotEnv.config()
create_github_repository(ENV["GITHUB_ACCESS_TOKEN"], "test2", true)