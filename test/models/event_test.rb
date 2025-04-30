# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  ended_at   :datetime
#  memo       :text
#  name       :string           not null
#  started_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :integer
#
require "test_helper"

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
