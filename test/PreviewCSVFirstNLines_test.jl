include("../src/PreviewCSVFirstNLines.jl")

file_path = "./data/output/1037_108年彰化縣空氣品質感測物聯網巡檢比對_2020_01_pm2_5_0.csv"
rows = 10

preview_csv_first_n_lines(file_path, rows)