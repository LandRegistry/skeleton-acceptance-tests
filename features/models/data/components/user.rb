# frozen_string_literal: true

# An abstract class for the data a user enters
class User
  attr_reader :skeleton
  attr_reader :service
  attr_reader :address
  attr_reader :checkbox
  attr_reader :file

  def initialize
    @skeleton = skeleton
    @service = service
    @address = address
    @checkbox = checkbox
    @file = file
  end
end
