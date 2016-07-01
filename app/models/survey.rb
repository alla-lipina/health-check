class Survey < ActiveRecord::Base
  belongs_to :organization
  has_many :votes
  has_many :tokens

  default_scope { order :stop_at }

  def self.last_finished
    Survey.where("stop_at < ?", Date.today).last
  end
  
  def participants_count(team_id=nil)
    votes = self.votes
    votes = votes.by_team(team_id) if team_id.present?
    debugger
    votes.count / organization.questions.count
  end

  def trend(team_id, question_id)
    votes.by_team(team_id).by_question(question_id).avg - 
      previous.votes.by_team(team_id).by_question(question_id).avg
  end

  def previous
    Survey.where("stop_at < ?", stop_at).last
  end

  def last(amount=1)
    Survey.where("stop_at < ?", stop_at)[-amount,-1]
  end
end
