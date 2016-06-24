class AddLastIpAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_ip_address, :string
  end
end
