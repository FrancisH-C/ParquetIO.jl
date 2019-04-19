################################################################################
# csv ↦ pqt
################################################################################

function csv2pqt(file_csv::String, output_pqt::String)
	export_pqt(CSV.read(file_csv), output_pqt)
end
