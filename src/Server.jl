import Pkg
Pkg.add("Genie")
using Genie, Genie.Requests, Genie.Renderer.Json

route("/") do
  (:message => "Hi there! 12345") |> json
end
original_folder = pwd()
route("/falra/dist/", method = POST) do
  @show jsonpayload()
  @show rawpayload()
  cd("github/bohachu/add")
  output=readchomp(`julia main.jl 2 3`)
  @show output
  cd(original_folder)
  (:message => "Hi there! 67890") |> json
end


up(8080,"0.0.0.0",async=true,verbose=false)
