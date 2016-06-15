class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  
  def index
    @questions = current_org.questions.all
  end

  def show
  end

  def new
    @question = current_org.questions.new
  end

  def edit
  end

  def create
    @question = current_org.questions.new(question_params)
    
    if @question.save
      redirect_to organization_questions_url
    else
      render 'new'
    end
  end

  def update
    if @question.update(question_params)
      redirect_to organization_questions_url
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
   
    redirect_to organization_questions_url
  end

  private
    def set_question
      @question = current_org.questions.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :text)
    end
end
