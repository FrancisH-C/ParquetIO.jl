# ParquetIO

## Notes

### What is it? 
It is a simple ad hoc solution that works with my data unlike other tested
parquet packages. It is not updated, because it works for its intended purposes. 

It does the following :
-Import parquet files as DataFrame. 
-Export DataFrames as parquet.

### How does it works

It uses Pycall to import parquet, then interpret it as Pandas.DataFrame and
finaly convert it to DataFrames.DataFrame (revert this to export). 

*** The key point is that *** it imports and exports the value NaN::Float64.
To do so, it overwrites recode! and uses it to recode every missing or nothing
value to NaN::Float64.

## Instalation
```
pkg> add https://github.com/FrancisH-C/ParquetIO.jl
```

## Usage

To import file.pqt as DataFrame then export it to anotherfile.pqt :
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
