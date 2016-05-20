class Token < ActiveRecord::Base
  belongs_to :team
  belongs_to :survey
end
