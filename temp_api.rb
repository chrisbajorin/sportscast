
game_array = Football.where("home_team = ?", "New York Giants")
date_array =[]
game_array.each do |game|
  mintemp = []
  meantemp = []
  maxtemp = []
  minwind = []
  meanwind = []
  maxwind = []
  precip = []
  cldcvr = []
  hum = []
  cache = Weather.new({game_id: game.game_id})
  if cache.class.exists?(game_id: game.game_id) == false
    for i in 1..6
      date_array = game.date.split("-")
      date_array[0] = date_array[0].to_i - i
      game_date = date_array.join("-")
      url = "https://api.weathersource.com/v1/#{ENV['WEATHERSOURCE_CLIENT_ID']}/history_by_postal_code.json?period=day&postal_code_eq=#{game[:zip]}&country_eq=US&timestamp_eq=#{game_date}&fields=tempMax,tempAvg,tempMin,precip,snowfall,windSpdMax,windSpdAvg,windSpdMin,cldCvrAvg,relHumAvg"
      response = HTTParty.get(url)
      if response[0] != nil
        mintemp << response[0]["tempMin"]
        meantemp << response[0]["tempAvg"]
        maxtemp << response[0]["tempMax"]
        minwind << response[0]["windSpdMin"]
        meanwind << response[0]["windSpdAvg"]
        maxwind << response[0]["windSpdMax"]
        precip << response[0]["precip"]
        cldcvr << response[0]["cldCvrAvg"]
        hum << response[0]["relHumAvg"]
      else
        mintemp << "nil"
        meantemp << "nil"
        maxtemp << "nil"
        minwind << "nil"
        meanwind << "nil"
        maxwind << "nil"
        precip << "nil"
        cldcvr << "nil"
        hum << "nil"
        # puts "none"
      end
      puts i
      sleep 0.1
    end
    cache = Weather.new({
          sport: game.class.name,
          game_id: game.game_id,
          min_temp: mintemp.join(","),
          mean_temp: meantemp.join(","),
          max_temp: maxtemp.join(","),
          min_wind: minwind.join(","),
          mean_wind: meanwind.join(","),
          max_wind: maxwind.join(","),
          precipitation: precip.join(","),
          cloud_cover: cldcvr.join(","),
          humidity: hum.join(",")
        })
    cache.save
    sleep 40
  else
    puts "entry exists already"
  end

end




game_array = Football.where("home_team = ?", "New York Giants")
date_array =[]
game_array.each do |game|
  mintemp = []
  meantemp = []
  maxtemp = []
  minwind = []
  meanwind = []
  maxwind = []
  precip = []
  cldcvr = []
  hum = []
  cache = Weather.new({game_id: game.game_id})
  if cache.class.exists?(game_id: game.game_id) == false
    for i in 1..6
      date_array = game.date.split("-")
      date_array[0] = date_array[0].to_i - i
      game_date = date_array.join("-")
      url = "http://api.wunderground.com/api/#{ENV['WUNDERGROUND_CLIENT_ID']}/history_#{game[:date].gsub(/-/,"")}/q/#{game[:state]}/#{game[:city].gsub(/ /,"_")}.json"
      response = HTTParty.get(url)
      if response[0] != nil
        mintemp << response['history']['dailysummary'][0]["mintempi"]
        meantemp << response['history']['dailysummary'][0]["meantempi"]
        maxtemp << response['history']['dailysummary'][0]["maxtempi"]
        minwind << response['history']['dailysummary'][0]["minwspdi"]
        meanwind << response['history']['dailysummary'][0]["meanwindspdi"]
        maxwind << response['history']['dailysummary'][0]["maxwspdi"]
        precip << response['history']['dailysummary'][0][]["precipi"]
        cldcvr << response['history']['observations'[15]["conds"]
        hum << response['history']['dailysummary'][0]["humidity"]
      else
        mintemp << "nil"
        meantemp << "nil"
        maxtemp << "nil"
        minwind << "nil"
        meanwind << "nil"
        maxwind << "nil"
        precip << "nil"
        cldcvr << "nil"
        hum << "nil"
        # puts "none"
      end
      puts i
      sleep 0.1
    end
    cache = Weather.new({
          sport: game.class.name,
          game_id: game.game_id,
          min_temp: mintemp.join(","),
          mean_temp: meantemp.join(","),
          max_temp: maxtemp.join(","),
          min_wind: minwind.join(","),
          mean_wind: meanwind.join(","),
          max_wind: maxwind.join(","),
          precipitation: precip.join(","),
          cloud_cover: cldcvr.join(","),
          humidity: hum.join(",")
        })
    cache.save
    sleep 40
  else
    puts "entry exists already"
  end

end


<!--
<script src="http://d3js.org/d3.v3.min.js"></script>
<script src="box.js"></script>
<script>

var margin = {top: 10, right: 50, bottom: 20, left: 50},
    width = 120 - margin.left - margin.right,
    height = 500 - margin.top - margin.bottom;

var min = Infinity,
    max = -Infinity;

var chart = d3.box()
    .whiskers(iqr(1.5))
    .width(width)
    .height(height);

d3.csv("morley.csv", function(error, csv) {
  var data = [];

  csv.forEach(function(x) {
    var e = Math.floor(x.Expt - 1),
        r = Math.floor(x.Run - 1),
        s = Math.floor(x.Speed),
        d = data[e];
    if (!d) d = data[e] = [s];
    else d.push(s);
    if (s > max) max = s;
    if (s < min) min = s;
  });

  chart.domain([min, max]);

  var svg = d3.select("body").selectAll("svg")
      .data(data)
    .enter().append("svg")
      .attr("class", "box")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.bottom + margin.top)
    .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
      .call(chart);

  setInterval(function() {
    svg.datum(randomize).call(chart.duration(1000));
  }, 2000);
});

function randomize(d) {
  if (!d.randomizer) d.randomizer = randomizer(d);
  return d.map(d.randomizer);
}

function randomizer(d) {
  var k = d3.max(d) * .02;
  return function(d) {
    return Math.max(min, Math.min(max, d + k * (Math.random() - .5)));
  };
}

// Returns a function to compute the interquartile range.
function iqr(k) {
  return function(d, i) {
    var q1 = d.quartiles[0],
        q3 = d.quartiles[2],
        iqr = (q3 - q1) * k,
        i = -1,
        j = d.length;
    while (d[++i] < q1 - iqr);
    while (d[--j] > q3 + iqr);
    return [i, j];
  };
}

</script>

 -->
<!-- <a href="#" data-reveal-id="myModal" class="button tiny">CALENDAR of events</a>

<div id="myModal" class="reveal-modal" data-reveal>
  <h2>CALENDAR</h2>
  <p class="lead">CALENDAR goes here</p>
  <p>Anything can go here really. Just testing this out and seeing how modals work. A possibility for sure.</p>
  <a class="close-reveal-modal">&#215;</a>
</div> -->

<!-- Dropdown  -->
<!--
<section class="main">

  <div class="fleft">
    <select id="cd-dropdown" class="cd-select">
      <option value="-1" selected>Choose a Team</option>
      <option value="1" id="Seattle_Seahawks" class="icon-camera">Seattle Seahawks</option>
      <option value="2" id="Atlanta_Falcons" class="icon-diamond">Atlanta Falcons</option>
      <option value="3" id="Chicago_Bears" class="icon-rocket">Chicago Bears</option>
      <option value="4" id="Houston_Texans" class="icon-star">Houston Texans</option>
      <option value="5" id="Kansas_City_Chiefs" class="icon-clock">Kansas City Chiefs</option>
      <option value="6" id="Miami_Dolphins" class="icon-clock">Miami Dolphins</option>
      <option value="7" id="New_York_Jets" class="icon-camera">New York Jets</option>
      <option value="8" id="Philadelphia_Eagles" class="icon-diamond">Philadelphia Eagles</option>
      <option value="9" id="Pittsburgh_Steelers" class="icon-rocket">Pittsburgh Steelers</option>
      <option value="10" id="St._Louis_Rams" class="icon-star">St. Louis Rams</option>
      <option value="11" id="Baltimore_Ravens" class="icon-clock">Baltimore Ravens</option>
      <option value="12" id="Dallas_Cowboys" class="icon-clock">Dallas Cowboys</option>
      <option value="13" id="Tampa_Bay_Buccaneers" class="icon-camera">Tampa Bay Buccaneers</option>
      <option value="14" id="Denver_Broncos" class="icon-diamond">Denver Broncos</option>
      <option value="15" id="Arizona_Cardinals" class="icon-rocket">Arizona Cardinals</option>
      <option value="16" id="Detroit_Lions" class="icon-star">Detroit Lions</option>
      <option value="17" id="Buffalo_Bills" class="icon-clock">Buffalo Bills</option>
      <option value="18" id="Carolina_Panthers" class="icon-clock">Carolina Panthers</option>
      <option value="19" id="Cincinnati_Bengals" class="icon-camera">Cincinnati Bengals</option>
      <option value="20" id="Cleveland_Browns" class="icon-diamond">Cleveland Browns</option>
      <option value="21" id="Minnesota_Vikings" class="icon-rocket">Minnesota Vikings</option>
      <option value="22" id="New_York_Giants" class="icon-star">New York Giants</option>
      <option value="23" id="Tennessee_Titans" class="icon-clock">Tennessee Titans</option>
      <option value="24" id="Washington_Redskins" class="icon-clock">Washington Redskins</option>
      <option value="25" id="San_Diego_Chargers" class="icon-star">San Diego Chargers</option>
      <option value="26" id="Green_Bay_Packers" class="icon-clock">Green Bay Packers</option>
      <option value="27" id="Oakland_Raiders" class="icon-clock">Oakland Raiders</option>
      <option value="28" id="San_Francisco_49ers" class="icon-camera">San Francisco 49ers</option>
      <option value="29" id="Indianapolis_Colts" class="icon-diamond">Indianapolis Colts</option>
      <option value="30" id="Jacksonville_Jaguars" class="icon-rocket">Jacksonville Jaguars</option>
      <option value="31" id="New_Orleans_Saints" class="icon-star">New Orleans Saints</option>
      <option value="32" id="New_England_Patriots" class="icon-clock">New England Patriots</option>
    </select>
  </div>
</section>
 -->
