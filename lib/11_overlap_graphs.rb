require_relative './09_consensus_sequence.rb'

class SequenceCollection
    def adjacency_list(suffix_or_prefix_length = 3, pretty_print = false)
        graph_list = []
        self.collection.each_with_index do |first_fasta_object, first_index|
            first_suffix = first_fasta_object.sequence[-3..-1]
            self.collection.each_with_index do |second_fasta_object, second_index|
                next if first_index == second_index
                second_prefix = second_fasta_object.sequence[0..2]
                if first_suffix == second_prefix
                    graph_list << [first_fasta_object.name, second_fasta_object.name]
                end
            end
        end
        if pretty_print
            graph_list.each do |edge|
                puts edge.join(" ")
            end
        end
        graph_list
    end
end
