class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :userName, :string
    add_column :users, :nickname, :string
  end
end
