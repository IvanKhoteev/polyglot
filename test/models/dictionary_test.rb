# == Schema Information
#
# Table name: dictionaries
#
#  id         :integer          not null, primary key
#  en         :string
#  ru         :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class DictionaryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
