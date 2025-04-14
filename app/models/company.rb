# == Schema Information
#
# Table name: companies
#
#  id          :integer          not null, primary key
#  information :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Company < ApplicationRecord
end
