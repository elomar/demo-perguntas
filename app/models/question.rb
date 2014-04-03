class Question < ActiveRecord::Base
  has_many :answers

  scope :available_to, -> (user) {
    includes(:answers).
    references(:answers).
    where("answers.user_id != ? or answers.user_id is null", user.id)
  }
end
