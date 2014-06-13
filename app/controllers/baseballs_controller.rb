class BaseballsController < ApplicationController
  before_action :set_baseball, only: [:show, :edit, :update, :destroy]

  # GET /baseballs
  # GET /baseballs.json
  def index
    @baseballs = Baseball.all
  end

  # GET /baseballs/1
  # GET /baseballs/1.json
  def show
  end

  # GET /baseballs/new
  def new
    @baseball = Baseball.new
  end

  # GET /baseballs/1/edit
  def edit
  end

  # POST /baseballs
  # POST /baseballs.json
  def create
    @baseball = Baseball.new(baseball_params)

    respond_to do |format|
      if @baseball.save
        format.html { redirect_to @baseball, notice: 'Baseball was successfully created.' }
        format.json { render :show, status: :created, location: @baseball }
      else
        format.html { render :new }
        format.json { render json: @baseball.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /baseballs/1
  # PATCH/PUT /baseballs/1.json
  def update
    respond_to do |format|
      if @baseball.update(baseball_params)
        format.html { redirect_to @baseball, notice: 'Baseball was successfully updated.' }
        format.json { render :show, status: :ok, location: @baseball }
      else
        format.html { render :edit }
        format.json { render json: @baseball.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /baseballs/1
  # DELETE /baseballs/1.json
  def destroy
    @baseball.destroy
    respond_to do |format|
      format.html { redirect_to baseballs_url, notice: 'Baseball was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_baseball
      @baseball = Baseball.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def baseball_params
      params.require(:baseball).permit(:date, :away_team, :home_team, :time, :city, :state, :zip)
    end
end
