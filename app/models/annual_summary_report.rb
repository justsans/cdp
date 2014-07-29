class AnnualSummaryReport < ActiveRecord::Base
  belongs_to :user
  has_many :answers,  :dependent => :destroy
end
