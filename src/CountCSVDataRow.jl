using CSV
using DataFrames

function count_csv_data_row(file_paths::Vector{String})
    total_rows = 0
    for file_path in file_paths
        data = CSV.read(file_path, DataFrame)
        rows = nrow(data)
        println("Number of rows in ", file_path, ": ", rows)
        total_rows += rows
    end
    println("Total sum of rows across all CSV files: ", total_rows)
end