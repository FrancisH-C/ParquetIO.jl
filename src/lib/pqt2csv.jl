################################################################################
# pqt ↦ csv 
################################################################################
"""
`pqt2csv(file_pqt, output_csv; recode=false)`
file.pqt ↦ file.csv : PaquetFile → CSVFile
"""
function pqt2csv(file_pqt, output_csv; recode=false)
	df=import_pqt(file_pqt)
	if recode
		todummy!(df)
	end
	try # will work if df does not contain nothing value
        	CSV.write(output_csv, df)
	catch
		error("You should try recode=true as an argument, read help")
	end
end
