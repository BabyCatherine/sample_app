class AddRememberTokenToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :remember_token, :string
  	add_index :users, :remember_token #Индекс в столбце RT нужен для поиска юзеров в БД по RT
  end
end
