require 'spec_helper'

describe RandomFacts::Generator do
  describe '#process' do
    it 'should respond with full list when no option is given' do
      output = RandomFacts::Generator.process
      expect(output).to be_kind_of Array
      expect(output.size).to eq(3162)
    end

    it 'should respond with proper list when size option is given' do
      output = RandomFacts::Generator.process({:size => 10})
      expect(output).to be_kind_of Array
      expect(output.size).to eq(10)
    end

    it 'should respond with proper list when type option is given' do
      output = RandomFacts::Generator.process({:type => 'animal kingdom'})
      expect(output).to be_kind_of Array
      expect(output.size).to eq(1399)
    end
  end

  describe '#sources' do
    it 'should respond with proper list' do
      output = RandomFacts::Generator.sources
      expect(output).to be_kind_of Array
      expect(output.size).to eq(25)
    end
  end

  describe '#valid_types' do
    it 'should respond with proper list' do
      output = RandomFacts::Generator.valid_types
      expect(output).to be_kind_of Array
      expect(output.size).to eq(25)
      expect(output).to eq([
          'animal kingdom',
          'cartoon',
          'customs',
          'earth',
          'expressions',
          'flags',
          'food',
          'grammar',
          'history',
          'human anatomy',
          'inventions',
          'legal',
          'literature',
          'math',
          'monetary',
          'movies',
          'music',
          'plants',
          'records',
          'religion',
          'space',
          'sports',
          'statistics',
          'trivia',
          'tv'
      ])
    end
  end
end