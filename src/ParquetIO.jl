module ParquetIO

export import_pqt, export_pqt

#--
using DataFrames, PyCall, Suppressor, ProgressMeter
import Pandas
#--


################################################################################
# parquet import/export
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
	println(pqt_file)
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


#--
"""
`ParquetIO.export_pqt(df, filename)`

input a DataFrame,  outpout a parquet file

# Arguments
* `df::DataFrame` : DataFrame to export as parquet
* `filename::String` : parquet file name to export
"""
function export_pqt(df, filename)
	# julia_df ↦ panda_df : DataFrames → df_pd
	columns=names(df)
	panda_df=Pandas.DataFrame()
	for i in 1:length(columns)
		panda_df[columns[i]]=df[columns[i]]
	end
	# export
	pd_df=pd.DataFrame(panda_df)
	pd_df.to_parquet(filename)
end
#--


end # module
