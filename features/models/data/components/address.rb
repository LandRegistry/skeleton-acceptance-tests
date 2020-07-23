# frozen_string_literal: true

# Abstract class for an address in the service
class Address
  attr_reader :line1
  attr_reader :line2
  attr_reader :town
  attr_reader :county
  attr_reader :postcode

  def initialize
    @line1 = line1
    @line2 = line2
    @town = town
    @county = county
    @postcode = postcode
  end
end
