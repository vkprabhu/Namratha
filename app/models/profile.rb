class Profile < ActiveRecord::Base
    belongs_to :user
    #before_save: { self.full_name = self.first_name + " " + self.last_name }
   # validates :employeeid, presence: true
    #validates :DOB, presence: true
    #validates :first_name, presence: true, length: { minimum: 10 , maximum: 12 }
    #validates :last_name, presence: true
    #validates :level, presence: true
    #validates :previous_manager, presence: true
    #validates :current_manager, presence: true
    #validates :experience, presence: true
    #validates :domain, presence: true
    #validates :hr, presence: true
    #validates :sublocation, presence: true
    #validates :primary_technology, presence: true
    #validates :secondary_technology, presence: true
    #validates :desgination, presence: true
    mount_uploader :avatar, AvatarUploader
end
