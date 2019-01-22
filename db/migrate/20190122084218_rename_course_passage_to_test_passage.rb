class RenameCoursePassageToTestPassage < ActiveRecord::Migration[5.2]
  def change
    rename_table :course_passages, :test_passages
  end
end
