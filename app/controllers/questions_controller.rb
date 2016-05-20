class QuestionsController < ApplicationController
  before_action :set_organization
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  
  def index
    @questions = @organization.questions.all
  end

  def show
  end

  def new
    @question = @organization.questions.new
  end

  def edit
  end

  def create
    @question = @organization.questions.new(question_params)
    
    if @question.save
      redirect_to organization_question_url
    else
      render 'new'
    end
  end

  def update
    if @question.update(question_params)
      redirect_to organization_question_url
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
   
    redirect_to questions_path
  end

  private
    def set_question
      @question = @organization.questions.find(params[:id])
    end

    def set_organization
      @organization = Organization.find(params[:organization_id])
    end

    def question_params
      params.require(:question).permit(:title, :text)
    end
end
