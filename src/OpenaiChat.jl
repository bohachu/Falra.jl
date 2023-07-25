using HTTP
using JSON
using DotEnv

DotEnv.config()
function openai_chat(message::String, api_key::String=ENV["OPENAI_API_KEY"])
    url = "https://api.openai.com/v1/chat/completions"
    headers = [
        "Content-Type" => "application/json",
        "Authorization" => "Bearer $api_key"
    ]

    body = Dict(
        "model" => "gpt-4",
        "messages" => [Dict("role" => "user", "content" => message)],
        "temperature" => 0,
        "max_tokens" => 4000
    )

    body_json = JSON.json(body)
    response = HTTP.request("POST", url, headers, body_json)
    response_body = String(response.body)
    response_json = JSON.parse(response_body)
    return response_json
end
