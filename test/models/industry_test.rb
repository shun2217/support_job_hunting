# == Schema Information
#
# Table name: industries
#
#  id         :integer          not null, primary key
#  interest   :integer          default("undecided"), not null
#  memo       :text
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class IndustryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
