# == Schema Information
#
# Table name: companies
#
#  id          :integer          not null, primary key
#  information :text
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Company < ApplicationRecord
  
  # モジュール

  # 関連

  # 委譲

  # バリデーション
  # validates :information, presence: false,
  #                         length: false
  validates :name,          presence: true
                            # length: false,

  # メソッド
end
