require_relative './04_fasta_sequence_processing.rb'

class SequenceCollection
    attr_accessor :collection

    def initialize(collection)
        @collection = collection
    end

    def retrieve_consensus
        established_length = @collection[0].sequence.length
        base_frequency_by_position = {
            :a => Array.new(established_length) { 0 },
            :c => Array.new(established_length) { 0 },
            :g => Array.new(established_length) { 0 },
            :t => Array.new(established_length) { 0 },
        }
        @collection.each do |fasta_object|
            raise "Sequences of uneven length." if fasta_object.sequence.length != established_length
            fasta_object.sequence.split("").each_with_index do |base, base_position|
                raise "Invalid base at position #{base_position} in sequence #{fasta_object.name}. Bad base was #{base}." if !(base.downcase =~ /[acgt]/)
                base_frequency_by_position[base.downcase.to_sym][base_position] += 1
            end
        end
        consensus_sequence = ""
        established_length.times do |position|
            frequencies = []
            base_frequency_by_position.each_value do |frequency_array|
                frequencies << frequency_array[position]
            end
            consensus_bases = ""
            base_frequency_by_position.each do |base, frequency_array|
                consensus_bases.concat(base.to_s.upcase) if frequency_array[position] == frequencies.max
            end
            consensus_sequence.concat(consensus_bases.length == 1 ? consensus_bases : "[#{consensus_bases}]")
        end
        puts first_permutation(consensus_sequence)
        puts "A: #{base_frequency_by_position[:a].join(" ")}"
        puts "C: #{base_frequency_by_position[:c].join(" ")}"
        puts "G: #{base_frequency_by_position[:g].join(" ")}"
        puts "T: #{base_frequency_by_position[:t].join(" ")}"
        consensus_sequence
    end
end

def first_permutation(sequence)
    parsed_sequence = ""
    hit_open = false
    first_base = false
    sequence.split("").each do |char|
        if char == "["
            hit_open = true
        elsif hit_open && !first_base
            first_base = true
            parsed_sequence.concat(char)
        elsif char == "]"
            first_base = false
            hit_open = false
            next
        elsif hit_open && first_base
            next
        else
            parsed_sequence.concat(char)
        end
    end
    parsed_sequence
end
