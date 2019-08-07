################################################################################
# csv ↦ pqt
################################################################################
"""
`csv2pqt(file_csv::String, output_pqt::String)`
file.csv ↦ file.pqt : CSVFile → PaquetFile
"""
function csv2pqt(file_csv::String, output_pqt::String)
	export_pqt(output_pqt, CSV.read(file_csv))
end
