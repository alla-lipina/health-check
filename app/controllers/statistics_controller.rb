class StatisticsController < ApplicationController

  def index
    @current_survey = Survey.last

    @survey = Survey.last_finished
    # &:name ~ {|t| t.name}
    teams_names = current_org.teams.map &:name
    participants = current_org.teams.map {|t| @survey.participants_count(t) }

    # How to make it integer without 1.5 on graph?
    @graph_data = {
      labels: teams_names,
      datasets: [{
        label: 'Total participants',
        data: participants,
        backgroundColor: 'rgba(54, 162, 235, 0.2)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
      }]
    };

  end

  def show
    @survey = Survey.last_finished
    @team = Team.find(params[:id])
    surveys = Survey.last(5).map { |s| s.stop_at.strftime("%d.%m.%y") }

    @team_graph_data = current_org.questions.map do |q|
      color = ["255, 99, 132", "54, 162, 235", "255, 206, 86", "75, 192, 192", "153, 102, 255", "255, 159, 64"].sample
      {
        question_id: q.id,
        labels: surveys,
        datasets: [{
          label: q.title,
          data: Vote.by_question(q.id).by_team(@team.id).map {|v| v.value*10},
          backgroundColor: "rgba(#{color}, 0.2)",
          borderColor: "rgba(#{color}, 1)",
          borderWidth: 1
        }]
      }
    end
  end 

end
