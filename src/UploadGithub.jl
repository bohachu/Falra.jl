# ./src/UploadGithub.jl
function upload_github(token::String, repo::String, files::Dict{String, String}, commit_message::String="ok", branch::String="main")
    username, repo_name = split(repo, '/')
    if !isdir(repo_name)
        run(`git clone https://$(token)@github.com/$(repo)`)
    end
    cd(repo_name)
    run(`git checkout $(branch)`)
    for (source_path, target_path) in files
        target_dir = dirname(target_path)
        if !isdir(target_dir)
            mkpath(target_dir)
        end
        println("UploadGithub.jl, source_path, tartget_path:",source_path, target_path)
        cp(source_path, target_path, force=true)
    end
    run(`git add .`)
    if !isempty(read(`git status --porcelain`, String))
        run(`git config --global user.email "cbh@cameo.tw"`)
        run(`git config --global user.name "bohachu"`)    
    
        run(`git commit -m $(commit_message)`)
    end
    run(`git push`)
    cd("..")
end
