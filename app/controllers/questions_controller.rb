class QuestionsController < ApplicationController

  def index
      @questions = Question.all
    end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    @question.quiz_id = (params[:quiz_id])
    @question.save!
    @quiz = Quiz.find(params[:quiz_id])
    redirect_to @quiz
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @quiz = Quiz.find(params[:quiz_id])
    if @question.update(question_params)
      redirect_to @quiz
    else
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @quiz = Quiz.find(params[:quiz_id])
    @question.destroy
    redirect_to @quiz
  end

  private

    def question_params
      params.require(:question).permit(:id, :title, :correct_answer, :answer2, :answer3, :answer4, :quiz_id)
    end


end
