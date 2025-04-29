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
class Industry < ApplicationRecord
   # モジュール
   enum interest: {
    undecided: 0,
    low: 1,
    middle: 2,
    high: 3,
  }

  # 関連
  has_many :companies

  # 委譲

  # バリデーション
  validates :name,          presence: true
  validates :interest,        presence: true

  # メソッド
end
