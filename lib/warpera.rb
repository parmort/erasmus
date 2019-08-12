# Deals with years possibly spanning different eras
module Warpera
  require 'warpera/pair'

  ##
  # Convert an integer-formatted year into a string-formatted year
  #
  # @param year [Integer] the integer-formatted year
  # @return [String] the string-formatted year
  def self.conv_s(year)
    raise ArgumentError, 'Argument is not an integer' unless year.is_a? Integer

    if year < 0
      "#{-1 * year} BCE"
    else
      "#{year} CE"
    end
  end

  ##
  # Convert a string-formatted year into an integer-formatted year
  #
  # @param year [String] the string-formatted year
  # @return [Integer] the integer-formatted year
  def self.conv_i(year)
    raise ArgumentError, 'Argument is not a string' unless year.is_a? String

    info = year.split
    if info[1] == 'CE'
      return info[0].to_i
    else
      return -1 * info[0].to_i
    end
  end
end
