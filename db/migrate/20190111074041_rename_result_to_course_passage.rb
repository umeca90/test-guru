class RenameResultToCoursePassage < ActiveRecord::Migration[5.2]
  def change
    rename_table :results, :course_passages
  end
end
