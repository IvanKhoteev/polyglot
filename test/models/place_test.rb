# == Schema Information
#
# Table name: places
#
#  id         :integer          not null, primary key
#  name_ru    :string           not null
#  name_en    :string           not null
#  pretext_ru :string           not null
#  pretext_en :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
