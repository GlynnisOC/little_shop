class AddAddressNicknameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :address_nickname, :integer, default: 0
  end
end
