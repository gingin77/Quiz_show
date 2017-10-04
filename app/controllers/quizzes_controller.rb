class QuizzesController < ApplicationController

  def play
    # I'm thinking we'll set up a route for like /quiz/:id/play that comes here?
    # so that from the dashboard, when a user clicks on a quiz they want to play
    # they come here... the quiz is "href'd to /quiz/:id/play?"
    @quiz = Quiz.find(params [:id])
    session[:quiz_total] = 0
    @user = User.find(session[:user_id])
    # Not sure if we need the quiz here but threw it in just in case
    @quiz.questions.each do |question|
    # Question.where(quiz_id: @quiz.id).find_each  do |question|
      # @correct = question.correct_answer
      @answer_array << [question.correct_answer, question.answer2, question.answer3, question.answer4]
      @answer_array.shuffle!
      # stuck them into the array so that we could shuffle them to render into the quiz
      # render the question & answers
      # if rendering the Q's & A's causes a post do we even come back here??
    end
    # after we've done each question, then I guess we end the quiz here somehow?
    # score is an integer so might need some fancier math here...
    Quizzes_users.create(user_id: @user.id, quiz_id: @quiz.id, score: (session[:quiz_total]/Question.where(quiz_id :@quiz.id).count) * 100)
  end

  def postplay
    if params[:answer] == @correct
      session[:quiz_total] += 1
      # somehow let the user know they've gotten it right
    else
      # somehow let the user know they've gotten it wrong
    end
  end

end
