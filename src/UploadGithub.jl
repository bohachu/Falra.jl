# ./src/UploadGithub.jl
function upload_github(user_directory, token::String, repo::String, files::Dict{String, String}, commit_message::String="ok", branch::String="main")
    println("user_directory:",user_directory)
    println("token:",token)
    println("repo:",repo)
    println("files:",files)
    println("commit_message:",commit_message)
    println("branch:",branch)
    username, repo_name = split(repo, '/')
    println("upload_github, pwd:",pwd())
    cd(user_directory)
    run(`rm -fr $(repo_name)`)
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
    run(`git pull`)
    run(`git add .`)
    if !isempty(read(`git status --porcelain`, String))
        run(`git config --global user.email "cbh@cameo.tw"`)
        run(`git config --global user.name "bohachu"`)    
    
        run(`git commit -m $(commit_message)`)
    end
    run(`git push`)
    cd("..")
end
