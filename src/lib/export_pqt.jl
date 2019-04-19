################################################################################
# Export Parquet
################################################################################
#--
"""
`ParquetIO.export_pqt(filename, df)`

input a DataFrame,  outpout a parquet file

# Arguments
* `filename::String` : parquet file name to export
* `df::DataFrame` : DataFrame to export as parquet
"""
function export_pqt(filename::String, df::DataFrame)
        # julia_df ↦ panda_df : DataFrames → df_pd
        pd=pyimport("pandas")
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
