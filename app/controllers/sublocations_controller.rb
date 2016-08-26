class SublocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sublocation, only: [:show, :edit, :update, :destroy]
  before_action :check_hr

  # GET /sublocations
  # GET /sublocations.json
  def index
    @sublocations = Sublocation.all
  end

  # GET /sublocations/1
  # GET /sublocations/1.json
  def show
  end

  # GET /sublocations/new
  def new
    @sublocation = Sublocation.new
  end

  # GET /sublocations/1/edit
  def edit
  end

  # POST /sublocations
  # POST /sublocations.json
  def create
    @sublocation = Sublocation.new(sublocation_params)

    respond_to do |format|
      if @sublocation.save
        format.html { redirect_to @sublocation, notice: 'Sublocation was successfully created.' }
        format.json { render :show, status: :created, location: @sublocation }
      else
        format.html { render :new }
        format.json { render json: @sublocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sublocations/1
  # PATCH/PUT /sublocations/1.json
  def update
    respond_to do |format|
      if @sublocation.update(sublocation_params)
        format.html { redirect_to @sublocation, notice: 'Sublocation was successfully updated.' }
        format.json { render :show, status: :ok, location: @sublocation }
      else
        format.html { render :edit }
        format.json { render json: @sublocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sublocations/1
  # DELETE /sublocations/1.json
  def destroy
    @sublocation.destroy
    respond_to do |format|
      format.html { redirect_to sublocations_url, notice: 'Sublocation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sublocation
      @sublocation = Sublocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sublocation_params
      params.require(:sublocation).permit(:name, :location_id)
    end
end
