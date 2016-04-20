# == Schema Information
#
# Table name: words
#
#  id         :integer          not null, primary key
#  word       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Word < ActiveRecord::Base
  has_many :phrases, dependent: :destroy
end
