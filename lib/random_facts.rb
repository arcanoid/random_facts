require 'random_facts/version'

module RandomFacts
  class Generator
    ROOT = File.expand_path("../..", __FILE__)

    def self.process(options = {})
      data_hash = read_all_hash_files
      random_numbers = []
      final_data = []

      # if options type is given filter out only the facts that refer to that kind of type
      if options[:type].nil?
        filtered_data = data_hash
      else
        filtered_data = data_hash.select { |fact| fact['type'] == options[:type] }
      end

      # if option size is given try to produce random numbers to select
      if options[:size].nil? || filtered_data.size == 0
        final_data = filtered_data
      else
        while random_numbers.size < options[:size]
          number = rand(filtered_data.size - 1)
          unless random_numbers.include? number
            random_numbers << number
          end
        end

        random_numbers.each do |index|
          final_data << filtered_data[index]
        end
      end

      final_data.map { |fact| fact['fact'] }
    end

    def self.valid_types
      data_hash = read_all_hash_files
      data_hash.collect { |fact| fact['type'] }.uniq.sort
    end

    def self.sources
      file_to_read = "#{ROOT}/data/sources.json"
      data = []
      file = File.read(file_to_read)
      data << JSON.parse(file).flatten

      data.flatten
    end

    #########
    protected
    #########

    def self.read_all_hash_files
      files_to_read = Dir["#{ROOT}/data/facts/*.json"]
      data = []

      files_to_read.each do |file_to_read|
        file = File.read(file_to_read)
        data << JSON.parse(file).flatten
      end

      data.flatten
    end
  end
end
