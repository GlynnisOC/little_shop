class AddPrimaryToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :primary, :boolean, :default => true
  end
end
