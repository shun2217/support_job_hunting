# == Schema Information
#
# Table name: companies
#
#  id          :integer          not null, primary key
#  desire      :integer          default(0), not null
#  information :text
#  memo        :text
#  my_page     :string
#  name        :string           not null
#  status      :integer          default(0), not null
#  strength    :text
#  weakness    :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  industry_id :integer
#
class Company < ApplicationRecord
  
  # モジュール
  enum desire: {
    undecided: 0,
    low: 1,
    middle: 2,
    high: 3,
  }
  enum status: {
    consideration: 0,
    entry: 1,
    intern: 2,
    scheduled_of_selection: 3,
    ongoing_of_selection: 4,
    done_of_selection: 5,
    failed_of_selection: 6,
  }

  # 関連

  # 委譲

  # バリデーション
  validates :desire,        presence: true
  validates :name,          presence: true
  validates :status,        presence: true

  # メソッド
end
