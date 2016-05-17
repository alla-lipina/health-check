class Organization < ActiveRecord::Base
  has_many :questions
  has_many :teams, dependent: :destroy
end
