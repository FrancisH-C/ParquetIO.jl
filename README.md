# ParquetIO

Uses Pandas.jl to import parquet files as DataFrames.DataFrame.
Overwrite recode! and uses it to recode every missing and nothing to NaN::Float64 (a usable type for parquet)

## Instalation
```
pkg> add https://github.com/FrancisH-C/ParquetIO.jl
```

## Usage

Import file.pqt as DataFrame then export it to anotherfile.pqt :

```
using ParquetIO
df=import_pqt("file.pqt")
export_pqt("anotherfile.pqt", df)
```

From file.csv to file.pqt and then back to file.csv :

```
csv2pqt("file.csv", "parquet.pqt")
pqt2csv("parquet.pqt", "file.csv")
```
