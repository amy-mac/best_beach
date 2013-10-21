if (!navigator.geolocation){
  output.innerHTML = "<p>Geolocation is not supported by your browser</p>";
}

navigator.geolocation.getCurrentPosition(function(position) {
  $("#lat").val(position.coords.latitude);
  $("#long").val(position.coords.longitude);
  
  // $.ajax({
  //   url: "/beaches",
  //   type: "POST",
  //   data: {
  //     latitude: lat,
  //     longitude: lon
  //   }
  // })

});