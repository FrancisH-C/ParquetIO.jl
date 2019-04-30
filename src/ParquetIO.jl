module ParquetIO

################################################################################
# Dependencies
################################################################################

using DataFrames, PyCall, CSV, CategoricalArrays
import Pandas

################################################################################
# Exported methods
################################################################################

export import_pqt, 
       export_pqt,
       isnothing, 
       recode!,
       tonothing!,
       todummy!,
       csv2pqt,
       pqt2csv

################################################################################
# Load lib
################################################################################

include("lib/import_pqt.jl")
include("lib/export_pqt.jl")
include("lib/csv2pqt.jl")
include("lib/pqt2csv.jl")
include("lib/recoding.jl")
include("lib/compatibility.jl")

end # module
