class Question < ActiveRecord::Base
  belongs_to :organization
  has_many :votes
  
  validates :title, presence: true,
                    length: { minimum: 5 }


  # def tendency(team_id)
  #   last_surveys = Survey.last(2).map {|sur| sur.id}
    
  #   avg_last_survey = Vote.by_survey(last_surveys.first).by_team(team_id).by_question(self.id).avg.to_f
  #   avg_second_last_survey = Vote.by_survey(last_surveys.last).by_team(team_id).by_question(self.id).avg.to_f
    
  #   avg_last_survey - avg_second_last_survey
  # end
end
