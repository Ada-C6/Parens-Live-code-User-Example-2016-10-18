class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :name
      t.string :email
      t.string :avatar
      t.integer :followercount

      t.timestamps null: false
    end
  end
end
