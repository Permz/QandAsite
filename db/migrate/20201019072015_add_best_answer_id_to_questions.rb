class AddBestAnswerIdToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :best_flg, :boolean, default: false
  end
end
