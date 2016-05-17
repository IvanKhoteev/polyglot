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

class PersonalPronoun < ActiveRecord::Base
  validates :ru_who, :ru_whom, :en_who, :en_whom, presence: true
end
