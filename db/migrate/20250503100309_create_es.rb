class CreateEs < ActiveRecord::Migration[7.0]
  def change
    create_table :es do |t|
      t.text        :question, null: false
      t.text        :answer
      t.integer     :event_id

      t.timestamps
    end
  end
end
