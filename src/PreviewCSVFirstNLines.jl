using CSV
using DataFrames

function preview_csv_first_n_lines(file_path::String, rows::Int)
    data = CSV.read(file_path, DataFrame)
    println(first(data, rows))
end