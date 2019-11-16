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
1. Install ParquetIO in julia

```
pkg> add https://github.com/FrancisH-C/ParquetIO.jl
```

2. Having the right tool for python in julia

Assuming JULIA_DEPOT_PATH is a path to your .julia file

```
shell> echo ENV["PYTHON"] = "" >>"\$JULIA_DEPOT_PATH/config/startup.jl"
pkg> add Conda, PyCall
julia> using Conda, PyCall
```

3. Make sure all python's packages are install for *PyCall.jl* 

```
pkg> Conda.add("numpy");Conda.add("pandas");Conda.add("pyarrow")
```

Then, try `julia> using ParquetIO` and if there is a error messages, install
missing packages forgot here.


## Usage

- To import file.pqt as DataFrame then export it to anotherfile.pqt :

```
julia> using ParquetIO
julia> df=import_pqt("file.pqt")
julia> export_pqt("anotherfile.pqt", df)
```

- From file.csv to file.pqt and then back to file.csv :

```
> julia> csv2pqt("file.csv", "parquet.pqt")
> julia> pqt2csv("parquet.pqt", "file.csv")
```

- All csv data to parquet 

```
julia> in_path="a_path"
julia> out_path="another_path"
julia> out_files=readlines(pipeline(`printf '%s\n' "$in_files"`, `sed 's/.csv/.pqt/g'`))

julia> for i in 1:length(in_files)
csv2pqt("$in_path/$(in_files[i])", "$out_path/$(out_files[i])")
end
```
