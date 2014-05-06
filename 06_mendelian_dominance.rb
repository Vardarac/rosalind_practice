def dominant_phenotype_probability(homozygous_dominant_organisms, heterozygous_organisms, homozygous_recessive_organisms)
    total_population = (homozygous_dominant_organisms + heterozygous_organisms + homozygous_recessive_organisms).to_f
    probability_from_homo_dom = homozygous_dominant_organisms / total_population
    probability_from_hetero = heterozygous_organisms / total_population * (
        homozygous_dominant_organisms / (total_population - 1) * 1.0 +
        (heterozygous_organisms - 1) / (total_population - 1) * 0.75 +
        homozygous_recessive_organisms / (total_population - 1) * 0.5
    )
    p probability_from_hetero
    probability_from_homo_rec = homozygous_recessive_organisms / total_population * (
        homozygous_dominant_organisms / (total_population - 1) * 1.0 +
        heterozygous_organisms / (total_population - 1) * 0.5 +
        (0) # No dominant alleles present in aa x aa
    )
    total_probability = probability_from_homo_dom + probability_from_hetero + probability_from_homo_rec
end
