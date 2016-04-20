# == Schema Information
#
# Table name: phrases
#
#  id         :integer          not null, primary key
#  word_id    :integer
#  ru         :string
#  en         :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_phrases_on_word_id  (word_id)
#

class Phrase < ActiveRecord::Base
  belongs_to :word
end
