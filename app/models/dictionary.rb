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

class Dictionary < ActiveRecord::Base
  STATUSES = %w(learned new repeated learned).freeze
end
