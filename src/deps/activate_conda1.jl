using Pkg
ENV["CONDA_JL_HOME"]="$(DEPOT_PATH[1])/conda/3/"
Pkg.build("Conda")
import Conda
Conda.runconda(`create --name PyCall --file conda_requirements.txt`)
