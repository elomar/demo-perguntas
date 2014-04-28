require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "questions brings answered questions" do
    assert_equal [questions(:one)], users(:answered_one).questions
  end

  test "available_questions does not bring answered question" do
    assert_not users(:answered_one).available_questions.include?(questions(:one))
  end

  test "available_questions brings unanswered questions" do
    assert_includes users(:answered_one).available_questions, questions(:two)
  end

  test "available_questions brings questions with no answer" do
    assert_includes users(:answered_one).available_questions, questions(:three)
  end
end
