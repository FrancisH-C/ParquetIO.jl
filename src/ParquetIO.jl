module ParquetIO


################################################################################
# Dependencies
################################################################################

using DataFrames, PyCall, Suppressor, ProgressMeter, CSV, CategoricalArrays
import Pandas

################################################################################
# Exported methods
################################################################################

export import_pqt, 
       export_pqt,
       recode!
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

end # module
