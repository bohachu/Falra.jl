include("../src/DecompressZipFile.jl")

file_path = "./data/1S61RyYRl1MgWZ1dUfh61czjgvnwsaKKh.zip"
output_path = "./data/output"

decompress_zip_file(file_path, output_path)