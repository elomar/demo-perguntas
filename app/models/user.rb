class User < ActiveRecord::Base
  has_many :answers
  has_many :questions, through: :answers

  def available_questions
    Question.includes(:answers).where("answers.user_id != ?", id).references(:answers)
  end
end
