# == Schema Information
#
# Table name: interrogatives
#
#  id         :integer          not null, primary key
#  ru         :string
#  en         :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Interrogative < ActiveRecord::Base
end
