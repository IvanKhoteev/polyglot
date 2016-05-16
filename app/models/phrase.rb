# == Schema Information
#
# Table name: phrases
#
#  id                :integer          not null, primary key
#  word_id           :integer
#  ru                :string
#  en                :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  lesson_identifier :string           not null
#
# Indexes
#
#  index_phrases_on_word_id  (word_id)
#

class Phrase < ActiveRecord::Base
  belongs_to :word
  has_many :personal_pronouns
  validates :lesson_identifier, presence: true
end
