# make /envs/PyCall the root environment
import Pkg
ENV["CONDA_JL_HOME"]="$(DEPOT_PATH[1])/conda/3/envs/PyCall/"
Pkg.build("Conda");
Pkg.build("PyCall");
import Conda
