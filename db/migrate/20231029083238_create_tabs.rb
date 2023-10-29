class CreateTabs < ActiveRecord::Migration[6.1]
  def change
    create_table :tabs do |t|
      t.float "total_seconds", default: 0
      t.datetime "start_date"
      t.datetime "finish_date"
      t.float "total_euros", default: 0
      t.bigint "beer_type_id"
      t.timestamps
    end
  end
end
