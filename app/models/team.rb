class Team < ActiveRecord::Base
  belongs_to :organization
  has_many :votes
  has_many :tokens


  def count_members
    self.emails.split(/\s*,\s*/).count
  end
end
