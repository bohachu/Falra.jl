using Pkg
Pkg.add("HTTP")
Pkg.add("JSON")
using HTTP
using JSON

url = "https://falradist.bowenchiu.repl.co/falra/dist/"

params = Dict(
  "token"=>"token123",
  "user_name"=>"bohachu",
  "project_name"=>"add",
  "lst_command"=> ["julia"],
  "script_filename"=>"main.jl",
  "lst_parameters"=>["3","4.2"]
)

response = HTTP.request("POST", url,
                    ["Content-Type" => "application/json"],
                    JSON.json(params))

println(response.status)
println(response.body)
println(JSON.parse(String(response.body)))
