class Employeeproject < ActiveRecord::Base
    belongs_to :user
    validates :domain, presence: true
    validates :start_date, presence: true
end
