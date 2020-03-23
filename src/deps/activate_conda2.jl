using Pkg
ENV["CONDA_JL_HOME"]="$JULIA_DEPOT_PATH/conda/3/envs/PyCall"
Pkg.build("Conda");
Pkg.build("PyCall");
using Conda
