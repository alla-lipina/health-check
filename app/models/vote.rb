class Vote < ActiveRecord::Base
  belongs_to :question
  belongs_to :team
  belongs_to :survey

  scope :by_team, -> (id) { where(team_id: id) }
  scope :by_survey, -> (id) { where(survey_id: id) }

  def self.avg
    average(:value)
  end
end
