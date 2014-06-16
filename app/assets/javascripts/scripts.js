///////////// D3 data functions /////////////

// for breaking the database weather strings into number arrays.
// if NaN, replaces with -1 for easier data manipulation with d3.
function splitToNumArray(string){
    var results_array = [];
    var temp_array = string.split(",");
    temp_array.forEach(function(num) {
        results_array.push(parseFloat(num));
    });
    results_array.forEach(function(x,i) {
        if (isNaN(x)) {
            results_array[i] = -1;
        }
    })
    return results_array;
}


function maxOfArray(numArray){
    return Math.max.apply(null, numArray);
}

function minOfArray(numArray){
    return Math.min.apply(null, numArray);
}

function combineMinMeanMax(minArray, meanArray, maxArray){
    var dataset = [];
    for (i=0; i < minArray.length; i++) {
        var combinedArray = [];
        combinedArray[0] = minArray[i];
        combinedArray[1] = meanArray[i];
        combinedArray[2] = maxArray[i];
        dataset.push(combinedArray);
    }
    return dataset;
}


// calendar functionality

function sortCalendarData(objects, team_id) {
    var teamName = team_id.split("_").join(" ");
    var gameObjects = {};
    objects.forEach(function(game){
        if ( game.home_team == teamName ){
            var dateArray = game.date.split("-");
            var dateString = (dateArray[1]+"-"+dateArray[2]+"-"+dateArray[0]);
            gameObjects[dateString] = ("<a class='calendar_entry' href=\"baseballs/"+game.id+"\"><p>" + game.away_team + " @<br> " + game.home_team + "</p><p class='game_time'>" + game.time + "</p></a>");
        }
    });
    return gameObjects;
}

$(document).foundation({
    dropdown: {
        active_class: 'open'
    }
});
