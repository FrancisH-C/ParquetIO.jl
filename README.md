# ParquetIO

Uses Pandas.jl to import parquet files as DataFrames.DataFrame.
Works with `Nothing` type unlike other solution.

## Instalation
```
pkg> add https://github.com/FrancisH-C/ParquetIO.jl
```

## Usage

Import file.pqt as DataFrame then export it to anotherfile.pqt :

```
import ParquetIO
df=ParquetIO.import_pqt("file.pqt")
ParquetIO.(df, "anotherfile.pqt")
```

From file.csv to file.pqt and then back to file.csv :

```
csv2pqt("file.csv", "parquet.csv")
pqt2csv("parquet.csv", "file.csv")
```
