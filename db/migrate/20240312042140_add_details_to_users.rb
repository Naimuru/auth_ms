class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    #add_column :users, :emailAddr, :string unless column_exists?(:users, :emailAddr)
    # Assuming :userName is already added; thus, it's commented out.
    # add_column :users, :userName, :string unless column_exists?(:users, :userName)
    add_column :users, :nickname, :string unless column_exists?(:users, :nickname)
    add_column :users, :keyIdAuth, :string unless column_exists?(:users, :keyIdAuth)

   # add_index :users, :emailAddr, unique: true unless index_exists?(:users, :emailAddr)
   # add_index :users, :userName, unique: true unless index_exists?(:users, :userName)
  end
end
