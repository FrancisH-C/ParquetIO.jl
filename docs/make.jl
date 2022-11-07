using Documenter, Example

makedocs(sitename="My Documentation")

deploydocs(
    repo = "https://github.com/FrancisH-C/ParquetIO.jl"
    versions = nothing
)
