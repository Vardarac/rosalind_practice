def calculate_expected_offspring(num_offspring = 2, *populations_by_genotype)
    # Parent Genotypes || Probability of Offspring Dominant Phenotype
    # -----------------||--------------------------------------------
    # AA x AA          || 100
    # AA x Aa          || 100
    # AA x aa          || 100
    # Aa x Aa          || 75
    # Aa x aa          || 50
    # aa x aa          || 50

    total_dominant_offspring = 0
    total_dominant_offspring += num_offspring * populations_by_genotype[0] * 1.0
    total_dominant_offspring += num_offspring * populations_by_genotype[1] * 1.0
    total_dominant_offspring += num_offspring * populations_by_genotype[2] * 1.0
    total_dominant_offspring += num_offspring * populations_by_genotype[3] * 0.75
    total_dominant_offspring += num_offspring * populations_by_genotype[4] * 0.5
    # populations_by_genotype[5] doesn't contribute to total_dominant_offspring
end
