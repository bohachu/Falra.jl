using ZipFile

function decompress_zip_file(file_path::String, output_path::String)
    z = ZipFile.Reader(file_path)
    try
        for f in z.files
            data = read(f)
            mkpath(output_path)
            open(joinpath(output_path, f.name), "w") do out_file
                write(out_file, data)
            end
            println("Unzipped path: ", joinpath(output_path, f.name))
        end
    finally
        close(z)
    end
end