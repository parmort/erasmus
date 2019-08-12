require 'warpera'

RSpec.describe Warpera::Pair do
  subject { Warpera::Pair.new(year: 2019, era: :ce) }

  it 'stores a year and an era' do
    year = 2019
    era = :ce

    pair = Warpera::Pair.new(year: year, era: era)

    expect(pair.year).to eq year
    expect(pair.era).to eq era
  end

  describe 'argument validations' do
    it 'raises an error if year is not an integer' do
      year = '2019'

      expect{
        Warpera::Pair.new(year: year, era: :ce)
      }.to raise_error ArgumentError
    end

    it 'raises an error if year is not a whole number' do
      year = -2019

      expect {
        Warpera::Pair.new(year: year, era: :ce)
      }.to raise_error ArgumentError
    end

    it 'raises an error if era is not a symbol' do
      era = 'ce'

      expect {
        Warpera::Pair.new(year: 2019, era: era)
      }.to raise_error ArgumentError
    end

    it 'raises an error if era is not the correct value' do
      era = :ad

      expect {
        Warpera::Pair.new(year: 2019, era: era)
      }.to raise_error ArgumentError
    end
  end

  describe '.to_s' do
    context 'with a current-era year' do
      it 'returns the year string' do
        expect(subject.to_s).to eq '2019 CE'
      end
    end

    context 'with a previous-era year' do
      it 'returns the year string' do
        subject.era = :bce

        expect(subject.to_s).to eq '2019 BCE'
      end
    end
  end

  describe '.to_i' do
    context 'with a current-era year' do
      it 'returns a positive year integer' do
        expect(subject.to_i).to eq 2019
      end
    end

    context 'with a previous-era year' do
      it 'returns a negative year integer' do
        subject.era = :bce

        expect(subject.to_i).to eq(-2019)
      end
    end
  end
end
