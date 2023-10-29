class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string "name"
      t.string "password_digest"
      t.references :tab, foreign_key: true
      t.integer "role_cd", default: 0
      t.timestamps
    end
  end
end
