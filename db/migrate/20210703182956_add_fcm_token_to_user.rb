class AddFcmTokenToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :fcm_token, :text
  end
end
