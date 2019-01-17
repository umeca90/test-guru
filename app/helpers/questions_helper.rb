module QuestionsHelper
  def question_header(question)
    header = question.new_record? ? 'Create new' : 'Edit'
    "#{header} #{question.test.title} Question"
  end
end
