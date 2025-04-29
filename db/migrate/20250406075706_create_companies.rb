class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string  :name,        null: false
      t.integer :industry_id
      t.text    :information
      t.text    :strength
      t.text    :weakness
      t.integer :status,      null: false, default: 0
      t.integer :desire,      null: false, default: 0
      t.string  :my_page
      t.text    :memo

      t.timestamps
    end
  end
end
