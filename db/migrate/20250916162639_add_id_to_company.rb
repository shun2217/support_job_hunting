class AddIdToCompany < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :login_id, :string
  end
end
