def parse_table(table_file)
    codon_hash = {}
    last = ""
    File.readlines(table_file).join("\n").chomp.split(" ").each do |raw_word|
        case raw_word.length
        when 0
            next
        when 3
            last = raw_word
        when 1, 4
            codon_hash[last] = raw_word
        end
    end
    codon_hash
end
