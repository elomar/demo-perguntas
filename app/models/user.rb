class User < ActiveRecord::Base
  has_many :answers
  has_many :questions, through: :answers

  def available_questions
    Question.available_to(self)
  end
end
