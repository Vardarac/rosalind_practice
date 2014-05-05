def parse_nucleotide_sequence(nucleotide_string)
  counts = [0, 0, 0, 0]
  nucleotide_string.split("").each do |base|
    case base
    when "A"
      counts[0] += 1
    when "C"
      counts[1] += 1
    when "G"
      counts[2] += 1
    when "T"
      counts[3] += 1
    end
  end
  puts counts
end
