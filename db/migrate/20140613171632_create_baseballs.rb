class CreateBaseballs < ActiveRecord::Migration
  def change
    create_table :baseballs do |t|
      t.string :date
      t.string :away_team
      t.string :home_team
      t.string :time
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
