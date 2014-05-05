def transcribe(dna_string)
    rna_string = ""
    dna_string.split("").each do |base|
        base == "T" ? rna_string << "U" : rna_string << base 
    end
    rna_string
end
