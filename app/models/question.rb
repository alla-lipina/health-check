class Question < ActiveRecord::Base
  belongs_to :organization
  has_many :votes
  
  validates :title, presence: true,
                    length: { minimum: 5 }
end
