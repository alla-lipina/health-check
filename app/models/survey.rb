class Survey < ActiveRecord::Base
  belongs_to :organization
  has_many :votes
  has_many :tokens
end
