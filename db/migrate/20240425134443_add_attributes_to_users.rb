class AddAttributesToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :last_login_time, :datetime
    add_column :users, :status, :string, default: 'active'
  end
end
