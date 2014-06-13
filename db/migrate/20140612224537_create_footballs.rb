class CreateFootballs < ActiveRecord::Migration
  def change
    create_table :footballs do |t|
      t.string :date
      t.string :away_team
      t.string :home_team
      t.string :time
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end
