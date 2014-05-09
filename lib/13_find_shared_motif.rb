require_relative './09_consensus_sequence.rb'

class SequenceCollection
    def longest_common_substrings
        subs = []
        shortest_sequence = nil
        shortest_sequence_index = nil
        self.collection.each_with_index do |fasta_object, index|
            shortest_sequence ||= fasta_object.sequence
            if fasta_object.sequence.length < shortest_sequence.length
                shortest_sequence = fasta_object.sequence
                shortest_sequence_index = index
            end
        end
        shortest_sequence.length.times do |parse_attempt_index| # once for each substring length
            break unless subs.empty?
            current_subsequence_length = shortest_sequence.length - parse_attempt_index
            (shortest_sequence.length - current_subsequence_length + 1).times do |substring_offset|
                current_subsequence = shortest_sequence[substring_offset..(substring_offset + current_subsequence_length - 1)]
                add_current_subsequence = true
                self.collection.each_with_index do |fasta_object, index|
                    next if shortest_sequence_index == index
                    unless fasta_object.sequence.include?(current_subsequence)
                        add_current_subsequence = false
                        break
                    end
                end
                add_current_subsequence ? subs << current_subsequence : next
            end
        end
        subs
    end
end
