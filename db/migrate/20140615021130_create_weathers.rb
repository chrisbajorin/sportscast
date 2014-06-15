class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.string :sport
      t.integer :game_id
      t.string :min_temp
      t.string :mean_temp
      t.string :max_temp
      t.string :min_wind
      t.string :mean_wind
      t.string :max_wind
      t.string :precipitation
      t.string :cloud_cover
      t.string :humidity

      t.timestamps
    end
  end
end
