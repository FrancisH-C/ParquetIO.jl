################################################################################
# csv ↦ pqt
################################################################################
"""
`csv2pqt(file_csv::String, output_pqt::String)`
file.csv ↦ file.pqt : CSVFile → PaquetFile
"""
function csv2pqt(output_pqt::String, file_csv::String)
	export_pqt(CSV.read(file_csv), output_pqt)
end
