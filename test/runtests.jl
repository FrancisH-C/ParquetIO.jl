using Test, ParquetIO, CSV, DataFrames

@testset "ParquetIO.jl" begin
@info "Testing ParquetIO"


df=DataFrame(int64=[1,2],string=["hello", "world"],
								 bigint=[111111111111111104,222222222222222208])

pqt="test.pqt"
csv="test.csv"

display(df)

CSV.write(csv, df)
df=CSV.read(csv)
display(df)

# Int128
df[!,end] = convert.(Int128, df[:,end])
df[!,end] = df[:,end].^2

export_pqt(pqt, df)
df=import_pqt(pqt)

csv2pqt(csv, pqt)
pqt2csv(pqt, csv)
end
