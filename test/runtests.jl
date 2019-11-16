#using ParquetIO
include("../src/ParquetIO.jl")
using .ParquetIO, CSV

pqt="test.pqt"
csv="test.csv"

@info "Testing ParquetIO"
df=CSV.read(csv)
# Int128
df[!,end] = convert.(Int128, df[!,end])
df[!,end] = df[!,end].^2

# testing
#display(df)
export_pqt(pqt, df)
df=import_pqt(pqt)
#display(df)

csv2pqt(csv, pqt)
pqt2csv(pqt, csv)
