class AddColumnToTestPassage < ActiveRecord::Migration[5.2]

  def change
    add_column :test_passages, :correct_question, :integer, default: 0
    add_reference :test_passages, :current_question, foreign_key: { to_table: :questions }
  end
end
