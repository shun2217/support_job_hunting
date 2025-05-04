class CreateEntrySheets < ActiveRecord::Migration[7.0]
  def change
    create_table :entry_sheets do |t|
      t.string      :title
      t.text        :question
      t.text        :answer
      t.integer     :event_id
      t.integer     :words
      t.text        :memo

      t.timestamps
    end
  end
end
