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
class Event < ApplicationRecord

  # モジュール

  # 関連
  belongs_to :company, optional: true
  has_many :entry_sheets

  # 委譲

  # バリデーション
  validates :name,          presence: true
  validate  :start_must_be_before_end_time

  # メソッド

  private

  def start_must_be_before_end_time
    return if started_at.blank? || ended_at.blank?

    if started_at > ended_at
      errors.add(:started_at, "は終了日時より前でなければなりません")
    end
  end
end
