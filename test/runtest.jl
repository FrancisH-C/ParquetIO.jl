module Test
    using CSV, DataFrames, PyCall
    include("../src/ParquetIO.jl")
    using .ParquetIO
    
    pqt="test.pqt"
    csv="test.csv"
    
    df=import_pqt(pqt)
    export_pqt("test.pqt", df)

    csv2pqt(csv, pqt)
    pqt2csv(pqt, csv)
end
