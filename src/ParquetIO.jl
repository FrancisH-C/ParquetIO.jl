module ParquetIO

#--
using DataFrames, PyCall, Suppressor, ProgressMeter
import Pandas
pd=pyimport("pandas")
pushfirst!(PyVector(pyimport("sys")."path"), "") # from PyCall doc
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
	panda_df=Pandas.DataFrame(pd.read_parquet(pqt_file))
	#panda_df ↦ julia_df : Pandas → DataFrames
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


################################################################################
# Testing
################################################################################

#--
"""
As  benchmark
"""
#function import_pqt_automatic(pqt_file)
#	# DataFrames.DataFrame(panda_df)
#	return DataFrames.DataFrame(Pandas.DataFrame(pd.read_parquet(pqt_file)))
#end
#--



"""
Importing
"""
#--
#stock="HXT"
#dates=readlines(`ls /data/banquenational/TSX/$stock/`)
#@showprogress 1 "$stock" for day in dates[1:2]
#	global trades=import_pqt("/data/banquenational/TSX/HXT/$day/trades.pqt")
#	global orders=import_pqt("/data/banquenational/TSX/HXT/$day/orders.pqt")
#	global orderbooks=import_pqt("/data/banquenational/TSX/HXT/$day/orderbooks.pqt")
#end
#--


"""
Exporting
"""
#-- 
#export_pqt(trades, "test.pqt")
#test=import_pqt("test.pqt")
#--

"""
Benchmarking
"""
##-- 
#TSX=readlines(`ls /data/banquenational/TSX/`)
#t0=time()
#stock="AAB"
#for stock in TSX # really 4 min/stock
#	dates=readlines(`ls /data/banquenational/TSX/$stock/`)
#	@showprogress 1 "$stock" for day in dates[1:2]
#		#global trades=import_pqt("/data/banquenational/TSX/HXT/$day/trades.pqt")
#		global orders=import_pqt("/data/banquenational/TSX/HXT/$day/orders.pqt")
#		#global orderbooks=import_pqt("/data/banquenational/TSX/HXT/$day/orderbooks.pqt")
#	end
#end

#t1=time()
#elapse=t1-t0
#println(elapse)
##--


"""
Sample of HXT 
"""
#--
#using CSV
#CSV.write("trades.csv", first(trades,6))
#CSV.write("orders.csv", first(orders,10))
#CSV.write("orderbooks.csv", first(orderbooks,10))
#--
end # module
