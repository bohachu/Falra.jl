using Base

function download_google_drive_file(doc_id::String, output_path::String)
    mkpath(output_path)
    cmd = ""
    if Sys.isapple()
        cmd = "export LANG=en_US.UTF-8; export LC_ALL=C; wget -q --load-cookies /tmp/cookies.txt \"https://docs.google.com/uc?export=download&confirm=\$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=$(doc_id)' -O- | sed -En 's/.*confirm=([0-9A-Za-z_]+).*/\\\\1\\\\n/p')&id=$(doc_id)\" -O $(output_path)/$(doc_id).zip && rm -rf /tmp/cookies.txt"
    else
        cmd = "export LANG=en_US.UTF-8; export LC_ALL=C; wget -q --load-cookies /tmp/cookies.txt \"https://docs.google.com/uc?export=download&confirm=\$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=$(doc_id)' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\\\\1\\\\n/p')&id=$(doc_id)\" -O $(output_path)/$(doc_id).zip && rm -rf /tmp/cookies.txt"
    end
    run(`bash -c $cmd`)
    println("Files have been successfully downloaded.")
end