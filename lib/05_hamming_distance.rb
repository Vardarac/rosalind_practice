def hamming_distance(sequence_a, sequence_b)
    distance = 0
    sequence_a.length.times do |i|
        distance += 1 if sequence_a[i] != sequence_b[i]
    end
    distance
end
