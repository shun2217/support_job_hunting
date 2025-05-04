# == Schema Information
#
# Table name: entry_sheets
#
#  id         :integer          not null, primary key
#  answer     :text
#  memo       :text
#  question   :text
#  title      :string
#  words      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#
require "test_helper"

class EntrySheetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
