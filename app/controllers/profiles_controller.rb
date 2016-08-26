class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  #before_action :check_hr, only: [:destroy, :new ]
  #before_action :check_manager, only: [:release]
  #before_action :check_his_manager_or_own_user, only: [:edit] // need to check this

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end


  def release
    @profile = Profile.find(params[:profile])
    last_project = @profile.user.employeeprojects.last
    last_project.end_date = Date.today
    @profile.previous_manager = @profile.current_manager
    @profile.current_manager = ""
    last_project.save
    @profile.save
    Notification.new_comment(@profile, current_user).deliver_now
    flash[:success] = "Successfully released the employee #{@profile.first_name}  #{@profile.last_name}"
    redirect_to :back
  end
  
  def select
    @projectrequirement = Projectrequirement.find(params[:requirement])
    @profile = Profile.find(params[:profile])
    @profile.user.employeeprojects.create(domain: @projectrequirement.domain, start_date: Date.today )
    @profile.current_manager = @projectrequirement.user.profile.first_name
    @profile.domain = @projectrequirement.domain
    @profile.save
    @projectrequirement.delete
    Notification.new_select(@profile,current_user).deliver_now
    flash[:success] = "Successfully selected the employee #{@profile.first_name}  #{@profile.last_name}"
    redirect_to root_path
  end
  
  def send_mes
    @profile = Profile.find(params[:profile])
    Notification.new_send(@profile,current_user).deliver_now
    flash[:success] = "Successfully sent the mail to #{@profile.first_name}  #{@profile.last_name}"
    redirect_to root_path
  end
  
  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to root_path, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end
    
    def check_his_manager_or_own_user
      if Profile.where('user_id = ?', current_user.id ) != current_user.profile || Profile.where('current_manager = ?', current_user.first_name) != current_user.first_name
        flash[:danger] = "You are not authorized!"
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:employeeid, :DOB, :first_name, :remove_avatar, :ready_to_mentor, :last_name, :phone_number, :level, :previous_manager, :current_manager, :experience, :domain, :hr, :sublocation, :primary_technology, :secondary_technology, :desgination, :avatar, :user_id)
    end
end
