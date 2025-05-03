class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string   :name,        null: false
      t.datetime :started_at
      t.datetime :ended_at
      t.integer  :company_id
      t.text     :memo

      t.timestamps
    end
  end
end
