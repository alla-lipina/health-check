class Survey < ActiveRecord::Base
  has_many :votes
  has_many :tokens
end
