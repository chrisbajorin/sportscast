class AddColumnGameIdToFootballs < ActiveRecord::Migration
  def change
    add_column :footballs, :game_id, :integer
  end
end
