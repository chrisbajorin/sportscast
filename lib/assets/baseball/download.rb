baseball_teams_array = [["al_bal", "110"], ["al_bos", "111"], ["al_cws", "145"], ["al_cle", "114"], ["al_det", "116"], ["al_hou", "117"], ["al_kc", "118"], ["al_ana", "108"], ["al_min", "142"], ["al_nyy", "147"], ["al_oak", "133"], ["al_sea", "136"], ["al_tb", "139"], ["al_tex", "140"], ["al_tor", "141"], ["nl_ari", "109"], ["nl_atl", "144"], ["nl_chc", "112"], ["nl_cin", "113"], ["nl_col", "115"], ["nl_la", "119"], ["nl_mia", "146"], ["nl_mil", "158"], ["nl_nym", "121"], ["nl_phi", "143"], ["nl_pit", "134"], ["nl_sd", "135"], ["nl_sf", "137"], ["nl_stl", "138"], ["nl_was", "120"]]


require 'open-uri'
year = "2014"


################
# CREATES CSV FILES IN baseball/year/(al/nl)
# FOLDERS MUST BE PRE-MADE
# TODO: CHECK FOR FILE EXISTANCE AND MAKE NECESSARY FOLDERS
################

baseball_teams_array.each do |team|
  open("#{year}/#{team[0][0..1]}/#{team[0][3..5]}.csv", 'wb') do |file|
    file << open("http://mlb.mlb.com/soa/ical/schedule.csv?home_team_id=#{team[1]}&season=#{year}").read
  end
end
