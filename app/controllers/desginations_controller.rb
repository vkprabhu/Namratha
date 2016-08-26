class DesginationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_desgination, only: [:show, :edit, :update, :destroy]
  before_action :check_hr
  # GET /desginations
  # GET /desginations.json
  def index
    @desginations = Desgination.all
  end

  # GET /desginations/1
  # GET /desginations/1.json
  def show
  end

  # GET /desginations/new
  def new
    @desgination = Desgination.new
  end

  # GET /desginations/1/edit
  def edit
  end

  # POST /desginations
  # POST /desginations.json
  def create
    @desgination = Desgination.new(desgination_params)

    respond_to do |format|
      if @desgination.save
        format.html { redirect_to @desgination, notice: 'Desgination was successfully created.' }
        format.json { render :show, status: :created, location: @desgination }
      else
        format.html { render :new }
        format.json { render json: @desgination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /desginations/1
  # PATCH/PUT /desginations/1.json
  def update
    respond_to do |format|
      if @desgination.update(desgination_params)
        format.html { redirect_to @desgination, notice: 'Desgination was successfully updated.' }
        format.json { render :show, status: :ok, location: @desgination }
      else
        format.html { render :edit }
        format.json { render json: @desgination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /desginations/1
  # DELETE /desginations/1.json
  def destroy
    @desgination.destroy
    respond_to do |format|
      format.html { redirect_to desginations_url, notice: 'Desgination was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_desgination
      @desgination = Desgination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def desgination_params
      params.require(:desgination).permit(:name)
    end
end
