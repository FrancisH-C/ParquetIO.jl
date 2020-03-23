using Pkg
ENV["CONDA_JL_HOME"]="$JULIA_DEPOT_PATH/conda/3/"
Pkg.build("Conda")
import Conda
Conda.runconda(`create --name PyCall --file conda_requirements.txt`)
