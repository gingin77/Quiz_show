class QuizzesController < ApplicationController

  def index
      @quizzes = Quiz.all
  end

  def new
    @quiz = Quiz.new
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def create
    @quiz = Quiz.new(quiz_params)
    # @quiz.author = User.find_by(id: session[:user_id])
    @quiz.save
    redirect_to @quiz
  end

  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.update(quiz_params)
      redirect_to @quiz
    else
      render 'edit'
    end
  end

  def play
    # I'm thinking we'll set up a route for like /quiz/:id/play that comes here?
    # so that from the dashboard, when a user clicks on a quiz they want to play
    # they come here... the quiz is "href'd to /quiz/:id/play?"
    @quiz = Quiz.find(params [:id])
    session[:quiz_total] = 0
    @user = User.find(session[:user_id])

    Quizzes_users.create(user_id: @user.id, quiz_id: @quiz.id, score: session[:quiz_total])
  end

  def postplay
    if params[:answer] == @correct
      session[:quiz_total] += 1
      # somehow let the user know they've gotten it right
    else
      # somehow let the user know they've gotten it wrong
    end
  end

  private

    def quiz_params
      params.require(:quiz).permit(:id, :title, :description)
    end


end
