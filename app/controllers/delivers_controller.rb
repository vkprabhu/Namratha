class DeliversController < ApplicationController
  before_action :set_deliver, only: [:show, :edit, :update, :destroy]

  # GET /delivers
  # GET /delivers.json
  def index
    @delivers = Deliver.all
  end

  # GET /delivers/1
  # GET /delivers/1.json
  def show
  end

  # GET /delivers/new
  def new
    @profile = Profile.find(params[:profile])
    @deliver = Deliver.new
  end

  # GET /delivers/1/edit
  def edit
  end

  # POST /delivers
  # POST /delivers.json
  def create
    @deliver = Deliver.new(deliver_params)

    respond_to do |format|
      if @deliver.save
        
         if Date.today == @deliver.date_of_release
            #@profile = Profile.find(params[:profile])
            @profile = Profile.find(@deliver.profile_id)
            last_project = @profile.user.employeeprojects.last
            last_project.end_date = @deliver.date_of_release - 1.days
            @profile.previous_manager = @profile.current_manager
            @profile.current_manager = ""
            last_project.save
            @profile.save
        end   
        
      #Notification.new_comment(@profile, current_user).deliver_now
      #flash[:success] = "Successfully released the employee #{@profile.first_name}  #{@profile.last_name}"
        format.html { redirect_to @deliver, notice: 'Deliver was successfully created.' }
        format.json { render :show, status: :created, location: @deliver }
      else
        format.html { render :new }
        format.json { render json: @deliver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /delivers/1
  # PATCH/PUT /delivers/1.json
  def update
    respond_to do |format|
      if @deliver.update(deliver_params)
        format.html { redirect_to @deliver, notice: 'Deliver was successfully updated.' }
        format.json { render :show, status: :ok, location: @deliver }
      else
        format.html { render :edit }
        format.json { render json: @deliver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delivers/1
  # DELETE /delivers/1.json
  def destroy
    @deliver.destroy
    respond_to do |format|
      format.html { redirect_to delivers_url, notice: 'Deliver was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deliver
      @deliver = Deliver.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deliver_params
      params.require(:deliver).permit(:date_of_release, :profile_id)
    end
end
