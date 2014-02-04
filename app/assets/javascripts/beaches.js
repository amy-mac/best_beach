if (!navigator.geolocation){
  output.innerHTML = "<p>Geolocation is not supported by your browser. Please find your coordinates online and enter them.</p>";
}

var getGeoLocation = function() {
  navigator.geolocation.getCurrentPosition(function(position) {
    $("#lat").val(position.coords.latitude);
    $("#long").val(position.coords.longitude);

  });
};

$(document).ready(function() {
  
});