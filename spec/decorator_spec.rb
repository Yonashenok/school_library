require './decorator'
require './person'
require './capitalizedecorator'
require './trimmerdecorator'
describe Decorator do
    before :all do
        @person = Person.new 22, 'tomasadisons'
        @capitalizer = CapitalizeDecorator.new @person
        @trimmer = TrimmerDecorator.new @person
      end
  context 'when testing the Decorater class' do
    it 'should be instance of the class' do
      # Assert
      expect(@capitalizer).to be_instance_of(CapitalizeDecorator)
    end
    it 'should be instance of the class' do
      # Assert
      expect(@trimmer).to be_instance_of(TrimmerDecorator)
    end

    it 'should return capitalize the first letter of the string when correct_name method called' do
        name = @capitalizer.correct_name
        expect(name).to eq 'Tomasadisons'
      end
  
      it 'should return 10 staring characters of string when correct_name method called' do
        trimmed_name = @trimmer.correct_name
        expect(trimmed_name).to eq 'tomasadiso'
      end
  end
end
