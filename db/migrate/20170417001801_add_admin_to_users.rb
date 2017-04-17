class AddAdminToUsers < ActiveRecord::Migration[5.0]
  
  def up
    add_column :users, :admin, :boolean
    User.reset_column_information
    User.update_all(admin: true)
  end

  def down
    remove_column :users, :admin
  end
end
