module FastaProcessing
    class FastaSequence
        attr_accessor :name, :sequence
        attr_reader :gc_content

        def initialize(name, sequence)
            @name = name
            self.sequence = sequence
        end

        def sequence=(sequence)
            @sequence = sequence
            @gc_content = FastaSequence.compute_gc_content(sequence)
        end

        def to_s
            "#{@name}: #{@sequence}"
        end

        def self.compute_gc_content(sequence)
            content = 0
            sequence.split("").each do |base|
                (base == "C" || base == "G") ? content += 1 : nil
            end
            content/sequence.length.to_f * 100
        end
    end
end

def retrieve_sequences_from_fasta(fasta_data_path)
    sequences = []
    raw_lines = File.readlines(fasta_data_path)
    raw_lines.each_with_index do |line, line_index|
        line.chomp!
        if line[0] == ">"
            sequences.empty? ? nil : sequences[-1].sequence = sequences[-1].sequence
            sequences << FastaProcessing::FastaSequence.new(line[1..-1], "")
        elsif line_index == raw_lines.length - 1
            sequences[-1].sequence.concat(line)
            sequences[-1].sequence = sequences[-1].sequence
        else
            sequences[-1].sequence.concat(line)
        end
    end
    sequences
end

def gc_content_retrieval(sequences)
    (sequences.sort {|a, b| b.gc_content <=> a.gc_content}).each do |sequence|
        puts sequence.name
        puts sequence.gc_content
    end
end
