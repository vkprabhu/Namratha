class Projectrequirement < ActiveRecord::Base
    belongs_to :user
    validates :level, presence: true
    validates :experience, presence: true
    validates :domain, presence: true
    validates :desgination, presence: true
    validates :primary_technology, presence: true
    validates :secondary_technology, presence: true
    validates :location, presence: true
    validates :sublocation, presence: true
end
