require_relative './09_consensus_sequence.rb'

class SequenceCollection
    def adjacency_list(suffix_or_prefix_length)
        graph_list = []
        self.collection.each_with_index do |first_fasta_object, first_index|
            first_suffix = first_fasta_object.sequence[-3]
            self.collection.each do |second_fasta_object, second_index|
                next if first_index == second_index
                second_prefix = second_fasta_object.sequence[3]
                if first_suffix == second_prefix
                    graph_list << [first_fasta_object.name, second_fasta_object.name]
                end
            end
        end
        graph_list
    end
end
