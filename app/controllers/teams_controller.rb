class TeamsController < ApplicationController
  before_action :set_organization
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # def index
  #   @teams = @organization.teams.all
  # end

  def show
  end

  def new
    @team = @organization.teams.new
  end

  def edit
  end

  def create
    @team = @organization.teams.new(team_params)

    if @team.save
      redirect_to @organization, notice: 'Team was successfully created.'
    else
      render :new
    end
  end

  def update
    if @team.update(team_params)
      redirect_to organization_team_url, notice: 'Team was successfully updated.'
    else
      render :edit 
    end
  end

  def destroy
    @team.destroy
    redirect_to @organization, notice: 'Team was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = @organization.teams.find(params[:id])
    end

    def set_organization
      @organization = Organization.find(params[:organization_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit([:name, :emails])
    end
end
