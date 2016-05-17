class Team < ActiveRecord::Base
  belongs_to :organization
  has_many :votes
end
