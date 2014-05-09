class RabbitPair
    attr_accessor :age, :tag_number
    @@number_created = 0

    def initialize
        @age = 0
        @@number_created += 1
        @tag_number = @@number_created
    end

    def breed(litter_size)
        return nil if @age < 1
        return Array.new(litter_size) { RabbitPair.new }
    end

    def increment_age
        @age += 1
    end

    def can_breed?
        @age >= 1
    end

    def to_s
        "Rabbit ##{@tag_number}: Age #{@age}"
    end
end

def estimate_rabbit_population_with_objects(months, options = {
        initial_population: 1,
        rabbit_lifespan: 3,
        pairs_per_generation: 1
    })
    puts "Month 1. Population: #{options[:initial_population]}"
    rabbit_pairs = Array.new(options[:initial_population]) { RabbitPair.new }
    (months - 1).times do |i|
        addendum = []
        rabbit_pairs.each do |pair|
           addendum.concat(pair.breed(options[:pairs_per_generation])) if pair.can_breed?
           pair.increment_age
        end
        births = addendum.length
        deaths = rabbit_pairs.length
        rabbit_pairs.delete_if do |pair|
            pair.age >= options[:rabbit_lifespan]
        end
        deaths = deaths - rabbit_pairs.length
        rabbit_pairs.concat(addendum)
        puts "Month #{i + 2}. Population: #{rabbit_pairs.length}; Births: #{births}; Deaths: #{deaths}"
    end
    return rabbit_pairs.length
end

def estimate_rabbit_population_with_algorithm(months = 6, rabbit_lifespan = 3)
    population_by_month = [1, 1]
    return 1 if months <= 2
    (3..months).each do |month|
        population_by_month.push(
            case month <=> rabbit_lifespan + 1
            when -1
                population_by_month[-1] + population_by_month[-2]
            when 0
                population_by_month[-1] + population_by_month[-2] - 1
            when 1
                population_by_month[-1] + population_by_month[-2] - population_by_month[-(rabbit_lifespan + 1)]
            end
        )
    end
    population_by_month[-1]
end
