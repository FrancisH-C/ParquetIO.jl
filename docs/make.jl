using Documenter, Example

makedocs(
    sitename = "ParquetIO.jl",
    authors = "Francis Huot-Chantal",
    checkdocs = :exports,
)

deploydocs(
    repo = "https://github.com/FrancisH-C/ParquetIO.jl",
    versions = nothing
)
