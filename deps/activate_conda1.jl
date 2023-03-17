# conda_requirement install in /envs/PyCall/
using Pkg, Conda
ENV["CONDA_JL_HOME"]="$(DEPOT_PATH[1])/conda/3/"
Pkg.build("Conda")
Conda.runconda(`create --name PyCall --file conda_requirements.txt`)
Pkg.build("Conda");
Pkg.build("PyCall");
