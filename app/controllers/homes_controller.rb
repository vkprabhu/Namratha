class HomesController < ApplicationController
   before_action :authenticate_user!
    def show
        
        if current_user.profile.nil?
            redirect_to new_profile_path
        else
            if current_user.profile.desgination == "Employee"
                @profile = current_user.profile
                @profiles = Profile.where('desgination = ?', "HR")
                @profiles_ready_to_mentor = Profile.where('ready_to_mentor = ?', true)
            elsif current_user.profile.desgination == "Manager"
                @profile = current_user.profile
                @profiles = Profile.where('current_manager = ?', current_user.profile.first_name)
                @profiles_ready_to_mentor = Profile.where('ready_to_mentor = ?', true)
            else 
                @profile = current_user.profile
                @profiles = Profile.all
                @domains = Domain.all
                @profiles_ready_to_mentor = Profile.where('ready_to_mentor = ?', true)
                @locations = Profile.where('location = ? and sublocation = ? and hr = ?', current_user.profile.location, current_user.profile.sublocation,current_user.profile.first_name)
            end
        end
    end
    
    def index
        if current_user.profile.desgination == "Manager"
            #@profiles = Profile.where('current_manager = ?', current_user.profile.first_name)
            @profiles = Profile.where('current_manager = ?', current_user.profile.first_name)
        elsif current_user.profile.desgination == "HR"
            #@profiles = Profile.all.paginate(:page => params[:page], :per_page => 10)
            #@profiles = Profile.all
            @profiles = Profile.where('sublocation = ? and Location = ?', current_user.profile.sublocation, current_user.profile.location)
        end
    end
end
