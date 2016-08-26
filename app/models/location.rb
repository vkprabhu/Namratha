class Location < ActiveRecord::Base
    has_many :sublocations
    validates :name, presence: true
end
