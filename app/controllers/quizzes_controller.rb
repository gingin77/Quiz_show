class QuizzesController < ApplicationController

  def new
    @quiz = Quiz.new
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def create
    @quiz = Quiz.new(quiz_params)
    # @quiz.user = User.find_by(id: session[:user_id])
    @quiz.save
    redirect_to @quiz
  end

  private

    def quiz_params
      params.require(:quiz).permit(:id, :title, :correct_answer, :url)
    end

end
