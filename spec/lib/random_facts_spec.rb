require 'spec_helper'

describe RandomFacts::Generator do
  describe '#process' do
    it 'should respond with full list when no option is given' do
      output = RandomFacts::Generator.process
      output.should be_kind_of Array
      output.size.should == 6511
    end

    it 'should respond with proper list when size option is given' do
      output = RandomFacts::Generator.process({:size => 10})
      output.should be_kind_of Array
      output.size.should == 10
    end

    it 'should respond with proper list when type option is given' do
      output = RandomFacts::Generator.process({:type => 'animals'})
      output.should be_kind_of Array
      output.size.should == 943
    end
  end

  describe '#valid_types' do
    it 'should respond with proper list' do
      output = RandomFacts::Generator.valid_types
      output.should be_kind_of Array
      output.size.should == 27
      output.should == [
          'animals',
          'cartoon',
          'customs',
          'earth',
          'expressions',
          'flags',
          'food',
          'grammar',
          'history',
          'human anatomy',
          'inventiond',
          'inventions',
          'legal',
          'math',
          'monetary',
          'movices',
          'movies',
          'music',
          'plants',
          'records',
          'religion',
          'screen',
          'space',
          'statistics',
          'trivia',
          'tv',
          'uncategorized'
      ]
    end
  end
end