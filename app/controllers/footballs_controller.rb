class FootballsController < ApplicationController

  # before_action :set_football, only: [:show, :edit, :update, :destroy]

  def index
    @footballs = Football.all

#======== To read d3 csv begins
    file = "morley.csv"
    open(file, "r+") do |f|
      f.read
    end
   # open("morley.csv", 'r')
#======== To read d3 csv ends

  end


  def show
    game = Football.find_by_id(params[:id])
    football_game_id = game.game_id
    # checks for existance of entry. if not, calls api and saves.
    if Weather.where("game_id = ?", football_game_id).exists? == false
      call_football_api(football_game_id)
    end

    respond_to do |format|
      format.html { @weather = Weather.where("game_id = ?", football_game_id) }
      format.json { render json: Weather.where("game_id = ?", football_game_id) }
    end
    # binding.pry
  end

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

