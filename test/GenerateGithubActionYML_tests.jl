include("../src/GenerateGithubActionYML.jl")

args = ["19Wzk1KW0Oars3x40MlE8vvi4Fdlfyxrj", "1e6pM1jrz5A7FLMOQYlc3l0HkSCwqEFkO", "1rCfSwXYRxkpCw76UHSNNlaHavhU0k3Ss"]
repository = "bohachu/bak_Falra.jl"
version = "1.9.0"
packages = ["CSV", "DataFrames", "ZipFile", "CodecZlib", "Dates", "GZip", "HTTP", "JSON", "ArgParse"]
path = "ai_gen"
script = "main.jl"
arg_name = "doc_id"
max_parallel = 20

generate_github_action_yml(args, repository, version, packages, path, script, arg_name, max_parallel)
