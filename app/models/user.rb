class User < ActiveRecord::Base
  has_many :answers
  has_many :questions, through: :answers

  def available_questions
    Question.includes(:answers).references(:answers).select("count(answers.id) as answer_count").group("answers.id").having("answers.user_id != ? or answer_count = 0", id)
  end
end
