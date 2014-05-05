def estimate_rabbit_population(months, pairs_per_generation, rabbits_array = [1, 1])
    return rabbits_array[-1] if months <= 2
    rabbits_array << pairs_per_generation * rabbits_array[-2] + rabbits_array[-1]
    estimate_rabbit_population(months - 1, pairs_per_generation, rabbits_array)
end
