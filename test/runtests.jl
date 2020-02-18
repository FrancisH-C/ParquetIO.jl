using Test, ParquetIO, CSV, DataFrames

@testset "ParquetIO.jl" begin
@info "Testing ParquetIO"
pqt="test.pqt"
csv="test.csv"
df=CSV.read(csv)

# Int128
df[!,end] = convert.(Int128, df[:,end])
df[!,end] = df[:,end].^2

export_pqt(pqt, df)
df=import_pqt(pqt)

csv2pqt(csv, pqt)
pqt2csv(pqt, csv)
end
