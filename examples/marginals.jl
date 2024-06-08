using PrivateMultiplicativeWeights

function marginals(d=20, order=3, n=1000, eps = 1)
    data_matrix = rand(0:1, d, n)
    data_matrix[3, :] = data_matrix[1, :] .* data_matrix[2, :]
    mw = mwem(Parities(d, order), Tabular(data_matrix), MWParameters(epsilon = eps, verbose=true))
    # print("times: ", typeof(mw[2][1]), mw[2][1])
    return mw
end

function factored_marginals(d=20, order=3, n=1000)
    data_matrix = rand(0:1, d, n)
    data_matrix[3, :] = data_matrix[1, :] .* data_matrix[2, :]
    mwem(FactorParities(d, order), Tabular(data_matrix), MWParameters(verbose=true))
end

function range_queries()
    histogram = vcat(zeros(100), ones(100), zeros(100))
    data = Histogram(histogram, 100)
    mwem(SeriesRangeQueries(300), data, MWParameters(repetitions=100, verbose=true))
end

# print("Elapsed time: ", @elapsed marginals())
# print("\n\n")

# print("Elapsed time: ", @elapsed factored_marginals())
# print("\n\n")

# print("Elapsed time: ", @elapsed range_queries())
# print("\n\n")
# num_samples = 1000
# domain_size = 100
# samples = rand(d_continuous, num_samples)

# function histogram_from_sample(samples, num_bins)
#     @assert 0 <= minimum(samples)
#     @assert maximum(samples) <= 1
#     h = zeros(num_bins)
#     for x in round(Int64, samples*num_bins)
#         h[x] += 1
#     end
#     collect(1:num_bins)/num_bins, h
# end

# xs, ys = histogram_from_sample(samples, domain_size)
# bar(xs, ys, width=1/domain_size);
mw = marginals()
