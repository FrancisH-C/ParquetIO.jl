################################################################################
# Import parquet
################################################################################
#--
"""
`ParquetIO.import_pqt(pqt_file::String)`

input *.pqt, output a DataFrame

# Arguments
* `pqt_file::String` : is a full path name of the parquet file 
"""
function import_pqt(pqt_file::String)
 	pd=pyimport("pandas")
	panda_df=Pandas.DataFrame(pd.read_parquet(pqt_file))
	# panda_df ↦ julia_df : Pandas → DataFrames
	names=Symbol.(Pandas.values.(Pandas.columns(panda_df)))
	df=DataFrames.DataFrame()
	for i in 1:length(names)
		df[names[i]]=Array(panda_df[names[i]])
	end
	return df
end
#--
