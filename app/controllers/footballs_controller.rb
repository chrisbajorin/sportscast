class FootballsController < ApplicationController
  require 'csv'
  # before_action :set_football, only: [:show, :edit, :update, :destroy]

  # GET /footballs
  # GET /footballs.json
  def index
    @footballs = Football.all

#======== To read d3 csv begins
    # file = "/morley.csv"
    # open(file, "r+") do |f|
    #   f.read
    # end
    CSV.read("morley.csv", 'r')
#======== To read d3 csv ends

  end

  # GET /footballs/1
  # GET /footballs/1.json
  def show
    game = Football.find_by_id(params[:id])
    football_game_id = game.game_id
    respond_to do |format|
      format.html { @weather = Weather.where("game_id = ?", football_game_id) }
      format.json { render json: Weather.where("game_id = ?", football_game_id) }
    end
    # binding.pry
  end


  # GET /footballs/new
  # def new
  #   @football = Football.new
  # end

  # GET /footballs/1/edit
  # def edit
  # end

  # POST /footballs
  # POST /footballs.json
  # def create
  #   @football = Football.new(football_params)

  #   respond_to do |format|
  #     if @football.save
  #       format.html { redirect_to @football, notice: 'Football was successfully created.' }
  #       format.json { render :show, status: :created, location: @football }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @football.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /footballs/1
  # PATCH/PUT /footballs/1.json
  # def update
  #   respond_to do |format|
  #     if @football.update(football_params)
  #       format.html { redirect_to @football, notice: 'Football was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @football }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @football.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /footballs/1
  # DELETE /footballs/1.json
  # def destroy
  #   @football.destroy
  #   respond_to do |format|
  #     format.html { redirect_to footballs_url, notice: 'Football was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_football
  #     @football = Football.find(params[:id])
  #   end

  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def football_params
  #     params.require(:football).permit(:date, :away_team, :home_team, :time, :city, :state, :zip)
  #   end
end

