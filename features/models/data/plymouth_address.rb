# frozen_string_literal: true

require_relative 'components/address'

# Class for the data used by the Skeleton User
class PlymouthAddress < Address
  def initialize
    @line1 = 'Flat 2'
    @line2 = '67 Skeleton Street'
    @town = 'Plymouth'
    @county = 'Devon'
    @postcode = 'PL11AA'
  end
end
