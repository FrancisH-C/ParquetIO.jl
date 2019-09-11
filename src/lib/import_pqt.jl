################################################################################
# Import parquet
################################################################################
"""
`ParquetIO.import_pqt(pqt_file::String)`

input *.pqt, output a DataFrame

# Arguments
* `pqt_file::String` : is a full path name of the parquet file 
"""
function import_pqt(pqt_file::String, convertUInt=true::Bool)
 	pd=pyimport("pandas")
	panda_df=Pandas.DataFrame(pd.read_parquet(pqt_file))
	# panda_df ↦ julia_df : Pandas → DataFrames
	columns_name=Symbol.(Pandas.values.(Pandas.columns(panda_df)))
	df=DataFrames.DataFrame()
	for i in 1:length(columns_name)
		df[!, columns_name[i]]=Array(panda_df[columns_name[i]])

		try # try to convert the type back
			df[!, columns_name[i]] = convert.(typeof(df[1, columns_name[i]]), df[!, columns_name[i]]) 
		catch
			println("Unable to give a subtype for $(i)th column")
		end
		
		if convertUInt && (typeof(df[1, columns_name[i]]) <: Unsigned)
			df[!, columns_name[i]] = convert.(Int128, df[!, columns_name[i]]) 
		end
	end
	return df
end
