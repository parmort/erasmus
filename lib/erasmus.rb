module Erasmus
  require 'erasmus/pair'

  def self.conv_s(year)
    raise ArgumentError, 'Argument is not numeric' unless year.is_a? Numeric

    if year < 0
      "#{-1 * year} BCE"
    else
      "#{year} CE"
    end
  end

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
