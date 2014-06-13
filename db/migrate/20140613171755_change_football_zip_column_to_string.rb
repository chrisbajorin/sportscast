class ChangeFootballZipColumnToString < ActiveRecord::Migration
  change_column :footballs, :zip, :string
end
