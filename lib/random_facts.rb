require 'random_facts/version'

module RandomFacts
  class Generator
    ROOT = File.expand_path("../..", __FILE__)

    def self.process(options = {})
      file = File.read("#{ROOT}/data/facts.json")
      data_hash = JSON.parse(file)
      random_numbers = []
      final_data = []

      # if options type is given filter out only the facts that refer to that kind of type
      if options[:type].present?
        filtered_data = data_hash['facts'].select { |fact| fact['type'] == options[:type] }
      else
        filtered_data = data_hash['facts']
      end

      # if option size is given try to produce random numbers to select
      if options[:size].present? && filtered_data.size > 0
        while random_numbers.size < options[:size]
          number = rand(filtered_data.size - 1)
          unless random_numbers.include? number
            random_numbers << number
          end
        end

        random_numbers.each do |index|
          final_data << filtered_data[index]
        end
      else
        final_data = filtered_data
      end

      final_data.map { |fact| fact['fact'] }
    end

    def self.valid_types
      file = File.read("#{ROOT}/data/facts.json")
      data_hash = JSON.parse(file)
      data_hash['facts'].collect { |fact| fact['type'] }.uniq.sort
    end
  end
end
