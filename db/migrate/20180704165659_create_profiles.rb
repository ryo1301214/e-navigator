class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :birthday
      t.integer :sex
      t.string :school

      t.timestamps
    end
  end
end
