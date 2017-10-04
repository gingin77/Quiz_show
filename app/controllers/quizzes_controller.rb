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

  private

    def quiz_params
      params.require(:quiz).permit(:id, :title, :description)
    end

end
