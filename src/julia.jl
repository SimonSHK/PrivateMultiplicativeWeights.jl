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

# generate data
# mw = marginals(20, 3, 1000, 3)
# print(typeof(mw))

# print(mw[2])
# print("mw 3: ", mw[3])
# print("mw 4: ", mw[4])

# iters = Array{Int64}(undef, length(mw[2]))
# for (i, iter) in enumerate(mw[2])
#     iters[i] = i
# end

# handle visualizations
# gcf().clear()

# # mw[1] = mwstate
# # mw[2] = time
# # mw[3] = error_means
# # mw[4] = error_maxes
# # iters = iterations
# p = plot(iters, mw[3])
# p = plot(iters, mw[4])

# # p.set_title('1')

# display(gcf())


# pyplot stuff
# fig, axs = subplots(X = 1, Y = 10, N = 1)


# gcf().clear()

#epsilon vs error max
epsilons = Float64[]
error_maxes = Float64[]
# for eps in range(1,10)

#     # mw = marginals(20, 3, 1000, eps)
#     mw = range_queries(eps)
#     # p = plot(iters, mw[3])
#     p = plot(iters, mw[4])
#     # mw = marginals(20,3,1000, (0.2 * eps))
#     # mw = range_queries(0.2 * eps)
#     # # p = plot(iters, mw[3])
#     # p = plot(iters, mw[4])
#     # p2 = plot(iters,mw[4])
    
#     # plot(rand(100, 4), layout = 4)
#     # plot((p, p2), layout = (2, 1))
#     push!(error_maxes, mw[3][end])
#     push!(epsilons, eps)

# end

# gcf().clear()
# plot(epsilons, error_maxes)
# range_queries()
# display(gcf())

# fig.canvas.draw()

# iters = Array{Int64}(undef, 40)
# for i in range(1,40)
#     iters[i] = i
# end

# gcf().clear()
# for eps in range(1,10)
#     mw = range_queries(eps, 40)
#     p = plot(iters, mw[4])
# end

# display(gcf())

#repetitions = 0, iterations = 80

num_iter = 240 
iters = Array{Int64}(undef, num_iter)
for i in range(1, num_iter)
    iters[i] = i
end

num_reps = 1
gcf().clear()
for eps in range(1,10)
    # range_queries(epsilon, iterations, repetitions)
    mw = range_queries(eps, num_iter, num_reps)
    p = plot(iters, mw[4])
end

display(gcf())