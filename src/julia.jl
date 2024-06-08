using Pkg
Pkg.activate(".")
Pkg.instantiate()

using Distributions
using PyPlot

using PrivateMultiplicativeWeights
Pkg.add("Distributions")
Pkg.add("Printf")
Pkg.add("Hadamard")
Pkg.add("LinearAlgebra")
Pkg.add("Random")
Pkg.add("IterTools")
Pkg.add("Statistics")
Pkg.add("Distributed")
Pkg.add("PyPlot")
Pkg.add("PyCall")

include("../examples/marginals.jl")

mw = marginals(20, 3, 1000, 3)
print(typeof(mw))

print(mw[2])
print("mw 3: ", mw[3])
print("mw 4: ", mw[4])

gcf().clear()


# mw[1] = mwstate
# mw[2] = time
# mw[3] = error mean_s
p = plot(mw[2], mw[3])
# p.set_title('1')

display(gcf())