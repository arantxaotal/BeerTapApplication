class CreateBeerTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :beer_types do |t|
      t.string "name"
      t.float "prize_per_litre"
      t.float "flow_volume", default: 0
      t.timestamps
    end
    add_foreign_key :tabs, :beer_types, column: :beer_type_id
  end
end
