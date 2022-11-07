using Documenter, Example

makedocs(
    modules = [ParquetIO],
    sitename = "ParquetIO.jl",
    authors = "Francis Huot-Chantal",
    checkdocs = :exports,
)

deploydocs(
    repo = "https://github.com/FrancisH-C/ParquetIO.jl",
    versions = nothing
)
