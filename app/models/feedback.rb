class Feedback < ActiveRecord::Base
  belongs_to :user
  has_many :feedback_sections,  :dependent => :destroy
end
