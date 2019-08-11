################################################################################
# csv ↦ pqt
################################################################################
"""
`csv2pqt(file_csv::String, output_pqt::String)`
file.csv ↦ file.pqt : CSVFile → PaquetFile
"""
function csv2pqt(file_csv::String, output_pqt::String; recode=true)
	df=CSV.read(file_csv)
	if recode
		toNaN!(df)
	end
	export_pqt(output_pqt, df)
end
