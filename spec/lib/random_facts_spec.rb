require 'spec_helper'

describe RandomFacts::Generator do
  describe '#process' do
    it 'should respond with full list when no option is given' do
      output = RandomFacts::Generator.process
      output.should be_kind_of Array
      output.size.should == 6414
    end

    it 'should respond with proper list when size option is given' do
      output = RandomFacts::Generator.process({:size => 10})
      output.should be_kind_of Array
      output.size.should == 10
    end

    it 'should respond with proper list when type option is given' do
      output = RandomFacts::Generator.process({:type => 'animal kingdom'})
      output.should be_kind_of Array
      output.size.should == 1384
    end
  end

  describe '#sources' do
    it 'should respond with proper list' do
      output = RandomFacts::Generator.sources
      output.should be_kind_of Array
      output.size.should == 25
    end
  end

  describe '#valid_types' do
    it 'should respond with proper list' do
      output = RandomFacts::Generator.valid_types
      output.should be_kind_of Array
      output.size.should == 26
      output.should == [
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
          'tv',
          'uncategorized'
      ]
    end
  end
end