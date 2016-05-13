class AddSurveyToVote < ActiveRecord::Migration
  def change
    add_reference :votes, :survey, index: true, foreign_key: true
  end
end
