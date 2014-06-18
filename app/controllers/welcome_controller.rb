class WelcomeController < ApplicationController
  def index
    #======== To read d3 csv begins
    file = "morley.csv"
    open(file, "r+") do |f|
      f.read
    end
   # open("morley.csv", 'r')
#======== To read d3 csv ends
  end
end
