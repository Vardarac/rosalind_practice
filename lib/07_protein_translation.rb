require './rna_codon_hash_generator.rb'

def translate(sequence)
    protein = ""
    genetic_code = parse_table('./codon_table.txt')
    sequence.chomp.split("").each_index do |codon_start_position|
        next if (codon_start_position + 3) % 3 != 0 || codon_start_position + 3 >= sequence.length
        protein.concat(genetic_code[sequence[codon_start_position..(codon_start_position + 2)]])
    end
    protein
end
