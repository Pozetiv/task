class ChangeTypeForUsersLogin < ActiveRecord::Migration[5.2]
  def change
    enable_extension :citext
    change_column :users, :login, :citext
  end
end
