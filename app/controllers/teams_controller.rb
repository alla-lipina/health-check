class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = current_org.teams.all
  end

  def show
  end

  def new
    @team = current_org.teams.new
  end

  def edit
  end

  def create
    @team = current_org.teams.new(team_params)

    if @team.save
      redirect_to current_org, notice: 'Team was successfully created.'
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
    redirect_to current_org, notice: 'Team was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = current_org.teams.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit([:name, :emails])
    end
end
