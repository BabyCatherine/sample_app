class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
  end
end
#Миграция для добавления булевого атрибута admin к пользователям. 