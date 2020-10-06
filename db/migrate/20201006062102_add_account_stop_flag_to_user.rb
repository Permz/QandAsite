class AddAccountStopFlagToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :stop_flg, :boolean
  end
end
