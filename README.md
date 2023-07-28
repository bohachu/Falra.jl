# Falra.jl
Falra.jl is a collection of Julia scripts designed to automate various tasks related to data processing, GitHub repository management, and interaction with APIs such as OpenAI's GPT-4 model. A key feature of Falra.jl is its ability to leverage GitHub Actions for distributed computing across multiple virtual machines (VMs) simultaneously. This allows for a significant speed-up in computation tasks, potentially making them up to 100 times faster.

The project aims to provide a set of tools that can be easily integrated into your workflow to increase productivity and efficiency. The scripts cover a wide range of functionalities, including counting the number of rows in CSV files, creating and managing GitHub repositories, decompressing zip files, dispatching GitHub actions, downloading files from Google Drive, downloading the latest artifacts from a GitHub workflow run, generating GitHub action YAML files, sending chat messages to OpenAI's GPT-4 model, previewing the first N lines of a CSV file, and uploading files to a GitHub repository.

Each script is designed to be standalone, meaning you can use them individually based on your needs. They are also modular and can be easily integrated into larger projects. The scripts use standard Julia packages, making them easy to install and run.

Whether you are a data scientist needing to process large CSV files, a developer managing GitHub repositories, or a researcher interacting with AI models, Falra.jl provides a handy set of tools to streamline your tasks. With its ability to harness the power of distributed computing through GitHub Actions, Falra.jl can significantly accelerate your computation tasks, making your workflow more efficient and productive.

# Julia scripts in this project
This repository contains a collection of Julia scripts that perform various tasks. Here is a brief introduction to each file and how to use them:

1. **InstallPkg.jl**: This script is used to install necessary Julia packages. It uses the `Pkg` module to add the required packages.

2. **CountCSVDataRow.jl**: This script reads CSV files and counts the number of rows in each file. It uses the `CSV` and `DataFrames` modules. To use this script, call the `count_csv_data_row` function with a vector of file paths as the argument.

3. **CreateGithubRepository.jl**: This script creates a new GitHub repository. It uses the `HTTP` and `JSON` modules. To use this script, call the `create_github_repository` function with your GitHub token, the desired repository name, and a boolean indicating whether the repository should be private.

4. **DecompressZipFile.jl**: This script decompresses a zip file. It uses the `ZipFile` module. To use this script, call the `decompress_zip_file` function with the file path and output path as arguments.

5. **DispatchGithubAction.jl**: This script dispatches a GitHub action. It uses the `HTTP` and `JSON` modules. To use this script, call the `dispatch_github_action` function with your GitHub token, the repository URL, the workflow YAML filename, and optionally the event type and client payload.

6. **DownloadGoogleDriveFile.jl**: This script downloads a file from Google Drive. It uses the `Base` module. To use this script, call the `download_google_drive_file` function with the document ID and output path as arguments.

7. **DownloadLatestArtifacts.jl**: This script downloads the latest artifacts from a GitHub workflow run. It uses the `HTTP`, `JSON`, `FilePaths`, and `Base64` modules. To use this script, call the `download_latest_artifacts` function with your GitHub token, the repository URL, the workflow YAML filename, and the output path.

8. **GenerateGithubActionYML.jl**: This script generates a GitHub action YAML file. It uses the `Printf` module. To use this script, call the `generate_github_action_yml` function with the necessary arguments.

9. **OpenaiChat.jl**: This script sends a chat message to OpenAI's GPT-4 model and returns the response. It uses the `HTTP`, `JSON`, and `DotEnv` modules. To use this script, call the `openai_chat` function with the message and optionally the API key.

10. **PreviewCSVFirstNLines.jl**: This script previews the first N lines of a CSV file. It uses the `CSV` and `DataFrames` modules. To use this script, call the `preview_csv_first_n_lines` function with the file path and the number of rows to preview.

11. **UploadGithub.jl**: This script uploads files to a GitHub repository. To use this script, call the `upload_github` function with the necessary arguments.

Please refer to the individual script files for more detailed usage instructions.

# Usage
Here is a brief guide on how to use each script in the Falra.jl collection:

1. **InstallPkg.jl**: To install the necessary Julia packages, simply run the script:
   ```julia
   include("InstallPkg.jl")
   ```

2. **CountCSVDataRow.jl**: To count the number of rows in a CSV file, use the `count_csv_data_row` function:
   ```julia
   include("CountCSVDataRow.jl")
   count_csv_data_row(["path_to_your_file.csv"])
   ```

3. **CreateGithubRepository.jl**: To create a new GitHub repository, use the `create_github_repository` function:
   ```julia
   include("CreateGithubRepository.jl")
   create_github_repository("your_github_token", "repository_name", private=true)
   ```

4. **DecompressZipFile.jl**: To decompress a zip file, use the `decompress_zip_file` function:
   ```julia
   include("DecompressZipFile.jl")
   decompress_zip_file("path_to_your_file.zip", "output_path")
   ```

5. **DispatchGithubAction.jl**: To dispatch a GitHub action, use the `dispatch_github_action` function:
   ```julia
   include("DispatchGithubAction.jl")
   dispatch_github_action("your_github_token", "repository_url", "workflow_yml_filename")
   ```

6. **DownloadGoogleDriveFile.jl**: To download a file from Google Drive, use the `download_google_drive_file` function:
   ```julia
   include("DownloadGoogleDriveFile.jl")
   download_google_drive_file("document_id", "output_path")
   ```

7. **DownloadLatestArtifacts.jl**: To download the latest artifacts from a GitHub workflow run, use the `download_latest_artifacts` function:
   ```julia
   include("DownloadLatestArtifacts.jl")
   download_latest_artifacts("your_github_token", "repository_url", "workflow_yml_filename", "output_path")
   ```

8. **GenerateGithubActionYML.jl**: To generate a GitHub action YAML file, use the `generate_github_action_yml` function:
   ```julia
   include("GenerateGithubActionYML.jl")
   generate_github_action_yml(args, "repository", "version", packages, "path", "script", "arg_name", max_parallel, "user_directory")
   ```

9. **OpenaiChat.jl**: To send a chat message to OpenAI's GPT-4 model, use the `openai_chat` function:
   ```julia
   include("OpenaiChat.jl")
   openai_chat("your_message", "your_api_key")
   ```

10. **PreviewCSVFirstNLines.jl**: To preview the first N lines of a CSV file, use the `preview_csv_first_n_lines` function:
    ```julia
    include("PreviewCSVFirstNLines.jl")
    preview_csv_first_n_lines("path_to_your_file.csv", number_of_rows)
    ```

11. **UploadGithub.jl**: To upload files to a GitHub repository, use the `upload_github` function:
    ```julia
    include("UploadGithub.jl")
    upload_github("user_directory", "your_github_token", "repository", Dict("source_path" => "target_path"), "commit_message", "branch")
    ```

Please refer to the individual script files for more detailed usage instructions.