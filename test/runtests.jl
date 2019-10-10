#using ParquetIO
include("../src/ParquetIO.jl")
using .ParquetIO

pqt="test.pqt"
csv="test.csv"

@info "Testing ParquetIO"
df=import_pqt(pqt)
#export_pqt("test.pqt", df)

#csv2pqt(csv, pqt)
#pqt2csv(pqt, csv)
