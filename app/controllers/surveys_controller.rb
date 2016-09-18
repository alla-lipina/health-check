class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  def index
    @surveys = current_org.surveys.all
  end

  def show
    #TODO: show the results of the survey only if stop_at passed
    if @survey.stop_at.past?
      render :show
    else
      redirect_to organization_surveys_url, notice: 'The survey is not finished yet.'
    end
  end

  def new
    @survey = current_org.surveys.new
  end

  def edit
  end

  def create
    @survey = current_org.surveys.new(survey_params)

    if @survey.save
      current_org.teams.each do | team |
        team.emails.split(/\s*,\s*/).each do | email |
          @token = Token.create!({ guid: SecureRandom.uuid, team_id: team.id, survey_id: @survey.id })
          TokenSender.token_email(@token, email).deliver_now
        end
      end
      
      redirect_to organization_surveys_url, notice: 'Survey was successfully created.'
    else
      render :new
    end
  end

  # organization can prolong the survey
  def update
    if @survey.update(survey_params)
      redirect_to organization_surveys_url, notice: 'Survey was successfully updated.'
    else
      render :edit 
    end
  end

  def destroy
    @survey.destroy
    redirect_to organization_surveys_url, notice: 'Survey was successfully destroyed.'
  end

  private
    def set_survey
      @survey = current_org.surveys.find(params[:id])
    end

    def survey_params
      params.require(:survey).permit([:start_at, :stop_at])
    end
end
