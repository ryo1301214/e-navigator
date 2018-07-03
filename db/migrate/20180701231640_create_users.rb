class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :birthday
      t.integer :sex, default: 0
      t.string :school
      t.string :password_digest

      t.timestamps
    end
  end
end
