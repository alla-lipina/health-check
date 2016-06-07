class Vote < ActiveRecord::Base
  belongs_to :question
  belongs_to :team
  belongs_to :survey

  scope :by_team, -> (id) { where(team_id: id) }
  scope :by_survey, -> (id) { where(survey_id: id) }
  scope :by_question, -> (id) { where(question_id: id) }

  def self.avg
    average(:value) || 0
  end

  def tendency(team_id, question_id)
    last_surveys = Survey.last(2).map {|sur| sur.id}
    
    avg_last_survey = Vote.by_survey(last_surveys.first).by_team(team_id).by_question(question_id).avg.to_f
    avg_second_last_survey = Vote.by_survey(last_surveys.last).by_team(team_id).by_question(question_id).avg.to_f
    
    @tendency = avg_last_survey - avg_second_last_survey
  end
end
