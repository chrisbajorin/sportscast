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


