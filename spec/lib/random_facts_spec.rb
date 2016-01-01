require 'spec_helper'

describe RandomFacts::Generator do
  describe '#process' do
    it 'should respond with full list when no option is given' do
      output = RandomFacts::Generator.process
      output.should be_kind_of Array
      output.size.should == 6448
    end

    it 'should respond with proper list when size option is given' do
      output = RandomFacts::Generator.process({:size => 10})
      output.should be_kind_of Array
      output.size.should == 10
    end

    it 'should respond with proper list when type option is given' do
      output = RandomFacts::Generator.process({:type => 'animals'})
      output.should be_kind_of Array
      output.size.should == 552
    end
  end

  describe '#valid_types' do
    it 'should respond with proper list' do
      output = RandomFacts::Generator.valid_types
      output.should be_kind_of Array
      output.size.should == 14
      output.should == [
          'animals',
          'customs',
          'food',
          'grammar',
          'history',
          'human anatomy',
          'legal',
          'math',
          'monetary',
          'plants',
          'screen',
          'space',
          'statistics',
          'uncategorized'
      ]
    end
  end
end