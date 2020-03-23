#https://github.com/conda/conda/wiki/CEP-1:-Replacing-root-environment-with-default-environment
using Conda, Suppressor
list = @capture_out Conda.runconda(`list -e`)
io = open("conda_requirements.txt", "w")
write(io, list)
close(io)
