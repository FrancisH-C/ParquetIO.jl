# ParquetIO

Uses Pandas.jl to import parquet files as DataFrames.DataFrame.
Works with `nothing` value unlike other solution.

## Instalation
```
pkg> add https://github.com/FrancisH-C/ParquetIO.jl
```

## Usage

Import file.pqt as DataFrame then export it to anotherfile.pqt

```
import ParquetIO
df=ParquetIO.import_pqt("file.pqt")
ParquetIO.(df, "anotherfile.pqt")
```

