class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.string :sport
      t.integer :game_id
      t.decimal :min_temp
      t.decimal :mean_temp
      t.decimal :max_temp
      t.decimal :min_wind
      t.decimal :mean_wind
      t.decimal :max_wind
      t.decimal :precipitation
      t.integer :cloud_cover
      t.decimal :humidity

      t.timestamps
    end
  end
end
