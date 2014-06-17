class BaseballsController < ApplicationController
  # before_action :set_baseball, only: [:show, :edit, :update, :destroy]

  # GET /baseballs
  # GET /baseballs.json
  def index
    team = params[:name].split("_").join(" ")
    # binding.pry
    respond_to do |format|
      format.html { @games = Baseball.where("home_team = ?", team) }
      format.json { render json: Baseball.where("home_team = ?", team) }
    end
  end

  # GET /baseballs/1
  # GET /baseballs/1.json
  def show
    # binding.pry
    game = Baseball.find_by_id(params[:id])
    baseball_game_id = game.game_id
    # checks for existance of entry. if not, calls api and saves.
    # if Weather.where("game_id = ?", baseball_game_id).exists? == false
    #   call_weather_api("Baseball", baseball_game_id)
    # end

    respond_to do |format|
      format.html { @weather = Weather.where("game_id = ?", baseball_game_id) }
      format.json { render json: Weather.where("game_id = ?", baseball_game_id) }
    end
      # binding.pry
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
