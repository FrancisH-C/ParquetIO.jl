################################################################################
# Export Parquet
################################################################################
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
