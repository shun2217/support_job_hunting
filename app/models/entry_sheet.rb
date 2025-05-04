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
class EntrySheet < ApplicationRecord
  # モジュール

  # 関連
  belongs_to :event, optional: true

  # 委譲

  # バリデーション

  # メソッド
end
