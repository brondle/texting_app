class AddMessagesAndContactsToUsers < ActiveRecord::Migration
  def change
    add_column :messages, :user_id, :integer
    add_column :contacts, :user_id, :integer
  end
end
