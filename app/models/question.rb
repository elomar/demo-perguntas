class Question < ActiveRecord::Base
  has_many :answers

  scope :available_to, -> (user) {
    includes(:answers).
    references(:answers).
    select("count(answers.id) as answer_count").
    group("answers.id").
    having("answers.user_id != ? or answer_count = 0", user.id)
  }
end
