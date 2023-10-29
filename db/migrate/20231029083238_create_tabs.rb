class CreateTabs < ActiveRecord::Migration[6.1]
  def change
    create_table :tabs do |t|
      t.integer "total_minutes"
      t.datetime "start_date"
      t.datetime "finish_date"
      t.integer "total_euros"
      t.timestamps
    end
  end
end
