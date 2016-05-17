class Vote < ActiveRecord::Base
  belongs_to :question
  belongs_to :team
  belongs_to :survey
end
