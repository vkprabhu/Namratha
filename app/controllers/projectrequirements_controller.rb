class ProjectrequirementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_projectrequirement, only: [:show, :edit, :update, :destroy]
  before_action :check_manager, only: [:new, :delete, :index, :show]

  # GET /projectrequirements
  # GET /projectrequirements.json
  def index
   # @projectrequirements = Projectrequirement.all
    @projectrequirements = current_user.projectrequirements.all
  end

  # GET /projectrequirements/1
  # GET /projectrequirements/1.json
  def show
        @projectrequirement = Projectrequirement.find(params[:id])
        sublocation = @projectrequirement.sublocation
        location = @projectrequirement.location
        primary_technology = @projectrequirement.primary_technology
        secondary_technology = @projectrequirement.secondary_technology
        domain = @projectrequirement.domain
        level = @projectrequirement.level
        experience = @projectrequirement.experience
        category = @projectrequirement.desgination
        @bench_profile = Profile.where('current_manager = ?', "")
        @profiles = []
        begin 
          Deliver.all.each do |p|
            @profiles << p.profile
          end
        rescue ActiveRecord::RecordNotFound
       end
        @bench_profiles = @bench_profile + @profiles
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

  # GET /projectrequirements/new
  def new
    @projectrequirement = Projectrequirement.new
  end

  # GET /projectrequirements/1/edit
  def edit
  end

  # POST /projectrequirements
  # POST /projectrequirements.json
  def create
    @projectrequirement = Projectrequirement.new(projectrequirement_params)
    @projectrequirement.user_id = current_user.id
    respond_to do |format|
      if @projectrequirement.save
        format.html { redirect_to projectrequirements_path, notice: 'Projectrequirement was successfully created.' }
        format.json { render :show, status: :created, location: @projectrequirement }
      else
        format.html { render :new }
        format.json { render json: @projectrequirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projectrequirements/1
  # PATCH/PUT /projectrequirements/1.json
  #def update
    #respond_to do |format|
      #if @projectrequirement.update(projectrequirement_params)
        #format.html { redirect_to @projectrequirement, notice: 'Projectrequirement was successfully updated.' }
        #format.json { render :show, status: :ok, location: @projectrequirement }
      #else
        #format.html { render :edit }
        #format.json { render json: @projectrequirement.errors, status: :unprocessable_entity }
      #end
    #end
  #end

  # DELETE /projectrequirements/1
  # DELETE /projectrequirements/1.json
  def destroy
    @projectrequirement.destroy
    respond_to do |format|
      format.html { redirect_to projectrequirements_url, notice: 'Projectrequirement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_projectrequirement
      @projectrequirement = Projectrequirement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def projectrequirement_params
      params.require(:projectrequirement).permit(:level, :experience, :domain, :desgination, :primary_technology, :secondary_technology, :location, :sublocation)
    end
end
