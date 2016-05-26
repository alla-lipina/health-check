class VotesController < ApplicationController
  
  before_action :set_token
  before_action :set_team
  before_action :set_organization

  skip_before_action :ensure_login, only: [:new, :create]

  def new
    if @token
      @vote = Vote.new
    end

    #TODO: think what if token does not exist 
    #   render "Where is token?"
  end

  def create
    params[:votes].each do |question_id, vote|
      Vote.create!(value: vote[:value], comment: vote[:comment], team_id: @token.team_id, question_id: question_id, survey_id: @token.survey_id)
    end

    # Delete token after use
    Token.find(@token).destroy

    #TODO: think where to redirect
    redirect_to root_url, notice: 'You votes are counted!'
  end

  private
    def set_organization
      @organization = Organization.find(@team.organization_id)
    end

    def set_team
      @team = Team.find(@token.team_id)
    end

    def set_token
      @token = Token.find_by(guid: params[:token])
    end
end
