include("../src/CountCSVDataRow.jl")

file_paths = ["./data/output/1037_108年彰化縣空氣品質感測物聯網巡檢比對_2020_01_humidity_0.csv",
"./data/output/1037_108年彰化縣空氣品質感測物聯網巡檢比對_2020_01_temperature_0.csv",
"./data/output/1037_108年彰化縣空氣品質感測物聯網巡檢比對_2020_01_pm2_5_0.csv"]

count_csv_data_row(file_paths)