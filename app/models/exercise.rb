# == Schema Information
#
# Table name: exercises
#
#  id         :integer          not null, primary key
#  activity   :string(255)
#  value      :float
#  units      :string(255)
#  completed  :date
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Exercise < ActiveRecord::Base
  belongs_to :user
  attr_accessible :activity, :completed, :units, :value, :user_id
end
