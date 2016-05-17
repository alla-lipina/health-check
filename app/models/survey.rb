class Survey < ActiveRecord::Base
  has_many :votes
end
