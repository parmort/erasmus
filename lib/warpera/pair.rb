module Warpera
  # Pairs year and era together for better readability and DRYing
  class Pair

    # The year as a whole number
    # @return [Integer] the year
    attr_accessor :year

    # The era
    # @return [:ce, :bce]
    attr_accessor :era

    ##
    # Sets the attributes
    #
    # @param year [Integer] the year
    # @param era [:ce, :bce] the era
    def initialize(year:, era:)
      @year = year
      @era = era

      raise ArgumentError, 'Year is not valid' unless valid_year?
      raise ArgumentError, 'Era is not valid' unless valid_era?
    end

    ##
    # Format the year and era into a string
    #
    # @example Current Era
    #   >> Warpera::Pair.new(year: 2019, era: :ce).to_s
    #   => "2019 CE"
    # @example Previous Era
    #   >> Warpera::Pair.new(year: 2019, era: :bce).to_s
    #   => "2019 BCE"
    #
    # @return [String] the formatted year
    def to_s
      "#{@year} #{@era.upcase}"
    end

    ##
    # Format the year and era into an integer
    #
    # @example Current Era
    #   >> Warpera::Pair.new(year: 2019, era: :ce).to_s
    #   => 2019
    # @example Previous Era
    #   >> Warpera::Pair.new(year: 2019, era: :bce).to_s
    #   => -2019
    #
    # @return [Integer] the formatted year
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
