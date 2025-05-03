# == Schema Information
#
# Table name: es
#
#  id         :integer          not null, primary key
#  answer     :text
#  question   :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#
class E < ApplicationRecord
end
