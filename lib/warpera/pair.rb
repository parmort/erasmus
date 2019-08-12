module Warpera
  class Pair
    attr_accessor :year, :era

    def initialize(year:, era:)
      @year = year
      @era = era

      raise ArgumentError, 'Year is not valid' unless valid_year?
      raise ArgumentError, 'Era is not valid' unless valid_era?
    end

    def to_s
      "#{@year} #{@era.upcase}"
    end

    def to_i
      if @era == :bce
        return -1 * @year
      end

      @year
    end

    private

    def valid_era?
      @era.is_a? Symbol and [:ce, :bce].include?(@era)
    end

    def valid_year?
      @year.is_a? Integer and @year >= 0
    end
  end
end
