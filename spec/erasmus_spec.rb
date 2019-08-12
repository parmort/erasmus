require 'erasmus'

RSpec.describe Erasmus do
  describe '.conv_s' do
    context 'when given a postive integer' do
      it 'returns a year in the current era' do
        expect(Erasmus.conv_s(1000)).to eq '1000 CE'
      end
    end

    context 'when given a negative integer' do
      it 'returns a year in the previous era' do
        expect(Erasmus.conv_s(-1000)).to eq '1000 BCE'
      end
    end

    context 'when given a non-integer' do
      it 'throws an ArgumentError' do
        expect{ Erasmus.conv_s('a string') }.to raise_error(ArgumentError)
      end
    end
  end

  describe '.conv_i' do
    context 'when given a current era year' do
      it 'returns a positive integer' do
        expect(Erasmus.conv_i('1000 CE')).to eq 1000
      end
    end

    context 'when given a previous era year' do
      it 'returns a negative integer' do
        expect(Erasmus.conv_i('1000 BCE')).to eq(-1000)
      end
    end

    context 'when given a non-string' do
      it 'raises ArgumentError' do
        expect{ Erasmus.conv_i(1000) }.to raise_error ArgumentError
      end
    end
  end

  it 'returns the starting string if put into both methods' do
    year = '2019 CE'

    output = Erasmus.conv_i(year)
    output = Erasmus.conv_s(output)

    expect(output).to eq year
  end

  it 'returns the starting integer if put into both methods' do
    year = 2019

    output = Erasmus.conv_s(year)
    output = Erasmus.conv_i(output)

    expect(output).to eq year
  end
end
