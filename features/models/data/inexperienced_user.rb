# frozen_string_literal: true

require_relative 'components/user'

# A user persona for someone who is using the service, because they want to use the skeleton.
class InexperiencedUser < User
  def initialize
    @skeleton = 'Yes'
    @service = 'I\'ve read all about the skeleton, and want to try it out!'
    @address = PlymouthAddress.new
    @checkbox = 'Skeleton'
    @file = single_upload_file
  end
end
