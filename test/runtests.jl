using ParquetIO
#include("../src/ParquetIO.jl")

pqt="test.pqt"
csv="test.csv"

@info "Testing ParqueIO"
df=import_pqt(pqt)
export_pqt("test.pqt", df)

csv2pqt(csv, pqt)
pqt2csv(pqt, csv)
