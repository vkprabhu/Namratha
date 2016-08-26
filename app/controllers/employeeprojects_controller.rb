class EmployeeprojectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employeeproject, only: [:show, :edit, :update, :destroy]
  before_action :check_hr, only: [:destroy]
  before_action :check_manager, only: [:new, :show, :update]

  # GET /employeeprojects
  # GET /employeeprojects.json
  def index
    @employeeprojects = Employeeproject.all
  end

  # GET /employeeprojects/1
  # GET /employeeprojects/1.json
  def show
  end

  # GET /employeeprojects/new
  def new
    @employeeproject = Employeeproject.new
  end

  # GET /employeeprojects/1/edit
  def edit
  end

  # POST /employeeprojects
  # POST /employeeprojects.json
  def create
    @employeeproject = Employeeproject.new(employeeproject_params)

    respond_to do |format|
      if @employeeproject.save
        format.html { redirect_to @employeeproject, notice: 'Employeeproject was successfully created.' }
        format.json { render :show, status: :created, location: @employeeproject }
      else
        format.html { render :new }
        format.json { render json: @employeeproject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employeeprojects/1
  # PATCH/PUT /employeeprojects/1.json
  def update
    respond_to do |format|
      if @employeeproject.update(employeeproject_params)
        format.html { redirect_to @employeeproject, notice: 'Employeeproject was successfully updated.' }
        format.json { render :show, status: :ok, location: @employeeproject }
      else
        format.html { render :edit }
        format.json { render json: @employeeproject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employeeprojects/1
  # DELETE /employeeprojects/1.json
  def destroy
    @employeeproject.destroy
    respond_to do |format|
      format.html { redirect_to employeeprojects_url, notice: 'Employeeproject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employeeproject
      @employeeproject = Employeeproject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employeeproject_params
      params.require(:employeeproject).permit(:start_date, :end_date, :domain, :user_id)
    end
end
