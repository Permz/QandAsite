class AddBestCommentFlagToComment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :best_flg, :boolean
  end
end
