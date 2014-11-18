class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :password_digest
      t.string  :email
      t.integer :age
      t.string  :address
      t.timestamps
    end
  	add_index :users, :email, unique: true, name: 'user_email'
  end
end
