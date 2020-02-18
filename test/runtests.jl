#using ParquetIO
using Test, ParquetIO, CSV

pqt="test.pqt"
csv="test.csv"

@info "Testing ParquetIO"
df=CSV.read(csv)

@testset "ParquetIO.jl" begin
# Int127
 df[:,end] = convert.(Int128, df[:,end])
 df[:,end] = df[:,end].^2
end
#
## testing
##display(df)
export_pqt(pqt, df)
df=import_pqt(pqt)
#display(df)
#
csv2pqt(csv, pqt)
pqt2csv(pqt, csv)
