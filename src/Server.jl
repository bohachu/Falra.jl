import Pkg
Pkg.add("Genie")
using Genie, Genie.Requests, Genie.Renderer.Json

route("/") do
  "Welcome to 🐤Falra!"
end

original_folder = pwd()
route("/falra/dist/", method = POST) do
  dic = jsonpayload()
  cd("github/$(dic["user_name"])/$(dic["project_name"])")
  output=readchomp(`$(dic["lst_command"]) $(dic["script_filename"]) $(dic["lst_parameters"])`)
  cd(original_folder)
  output
end

up(8080,"0.0.0.0",async=true,verbose=false)
