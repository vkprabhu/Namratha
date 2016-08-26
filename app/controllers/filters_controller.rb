class FiltersController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @requirement = Projectrequirement.find(params[:id])
        sublocation = @requirement.sublocation
        location = @requirement.location
        primary_technology = @requirement.primary_technology
        secondary_technology = @requirement.secondary_technology
        domain = @requirement.domain
        level = @requirement.level
        experience = @requirement.experience
        category = @requirement.desgination
        @bench_profiles = Profile.where('current_manager = ?', "")
        @req_sublocation_profiles = []
        @req_sublocation_location_profiles = []
        @req_sublocation_location_primary_technology_profiles = []
        @req_sublocation_location_primary_technology_secondary_technology_profiles = []
        @req_sublocation_location_primary_technology_secondary_technology_domain_profiles = []
        @req_sublocation_location_primary_technology_secondary_technology_domain_level_profiles = []
        @req_sublocation_location_primary_technology_secondary_technology_domain_level_experience_profiles = []
        
        @bench_profiles.each do |bp| 
           if bp.sublocation == sublocation
               @req_sublocation_profiles.append(bp)
           end
        end
        
        @req_sublocation_profiles.each do |sl|
            if sl.location == location
                @req_sublocation_location_profiles.append(sl)
            end
        end
        
        @req_sublocation_location_profiles.each do |l|
            if l.primary_technology == primary_technology
                @req_sublocation_location_primary_technology_profiles.append(l)
            end
        end
        
        @req_sublocation_location_primary_technology_profiles.each do |l|
            if l.secondary_technology == secondary_technology
                @req_sublocation_location_primary_technology_secondary_technology_profiles.append(l)
            end
        end
        
        @req_sublocation_location_primary_technology_secondary_technology_profiles.each do |l|
            if l.domain == domain
                @req_sublocation_location_primary_technology_secondary_technology_domain_profiles.append(l)
            end
        end
        
        @req_sublocation_location_primary_technology_secondary_technology_domain_profiles.each do |l|
            if l.level == level
                @req_sublocation_location_primary_technology_secondary_technology_domain_level_profiles.append(l)
            end
        end
        
        @req_sublocation_location_primary_technology_secondary_technology_domain_level_profiles.each do |l|
            if l.experience == experience
                @req_sublocation_location_primary_technology_secondary_technology_domain_level_experience_profiles.append(l)
            end
        end
        
    end
end
