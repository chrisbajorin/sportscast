class AddColumnGameIdToBaseballs < ActiveRecord::Migration
  def change
    add_column :baseballs, :game_id, :integer
  end
end
