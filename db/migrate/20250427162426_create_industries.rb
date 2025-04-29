class CreateIndustries < ActiveRecord::Migration[7.0]
  def change
    create_table :industries do |t|
      t.string     :name,       null: false
      t.integer    :interest,   null: false, default: 0
      t.text       :memo

      t.timestamps
    end
  end
end
