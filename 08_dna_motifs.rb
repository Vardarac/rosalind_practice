def motif_locations(long_sequence, subsequence)
    return nil if subsequence.length > long_sequence.length
    positions = []

    (long_sequence.length - subsequence.length + 1).times do |check_position|
        is_subsequence_here = true
        subsequence.split("").each_with_index do |letter, subcheck_position|
            is_subsequence_here = false if letter != long_sequence[check_position + subcheck_position]
            break unless is_subsequence_here
        end
        next unless is_subsequence_here
        positions << check_position + 1
    end
    positions.join(" ")
end
