def complement_dna_sequence(sequence)
    complement = []
    sequence.split("").each do |base|
        case base
        when "A"
            complement.unshift("T")
        when "G"
            complement.unshift("C")
        when "C"
            complement.unshift("G")
        when "T"
            complement.unshift("A")
        end
    end
    complement.join("")
end
