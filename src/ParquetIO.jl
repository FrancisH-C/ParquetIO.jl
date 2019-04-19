module ParquetIO


################################################################################
# Dependencies
################################################################################


#--
using DataFrames, PyCall, Suppressor, ProgressMeter
import Pandas
pd=pyimport("pandas")
pushfirst!(PyVector(pyimport("sys")."path"), "") # from PyCall doc
#--

################################################################################
# Exported methods
################################################################################

export import_pqt, export_pqt

################################################################################
# Load lib
################################################################################

include("lib/import_pqt.jl")
include("lib/export_pqt.jl")


end # module
