# == Schema Information
#
# Table name: personal_pronouns
#
#  id         :integer          not null, primary key
#  ru_who     :string
#  ru_whom    :string
#  en_who     :string
#  en_whom    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PersonalPronounTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
