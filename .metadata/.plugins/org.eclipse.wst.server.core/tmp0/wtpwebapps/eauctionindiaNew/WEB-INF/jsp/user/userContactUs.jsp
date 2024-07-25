<body onload="showByAddress()"> 
<div id="container">
	<h1>Contact Us</h1>
<%System.out.println("hello usercontact"); %>
	<div id="container-body">
		<p>
		&nbsp;
		</p>
		<p>
		
		<b>Mobile Nos: +91-88016-77777/88019-77777</b><br/>
		www.eauctionindia.in<br>
		Bluestones Infrastructure India Pvt. Ltd.<br>
		Royal Homes Sienna Grand, <br>
		5thFloor, <br>
		120-ShanthiNagar, <br>
		MasabTank, <br>
		Hyderabad - 500028, <br>
		Andhra Pradesh, <br>
		India.
		</p>
	</div>
	<div><b>For any queries contact us:<font color='red'>marketing@bluestone.net.in</font></b></div>
	<div class="map">
		<h3>Route Map </h3>
		
		<!-- <img class="imag" src="images/rtmp.JPG" /> -->
		<table><tr><td width="240"></td><td>
		<div class="gmap" id="gmap" align="center" >
				
		<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDm3Qcv-WvSkahV0HXEEYiGHcv8z5HzgJ8&sensor=false">
</script>
<script type="text/javascript">
var geocoder;
var map;
var infowindow = new google.maps.InfoWindow();
var marker;
var $ = jQuery;
$(document).ready(function() {
	geocoder = new google.maps.Geocoder();
	var mapOptions = {
          center: new google.maps.LatLng(0, 0),
          zoom: 8,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
	map = new google.maps.Map(document.getElementById("gmap"), mapOptions);
	showByAddress();
});
function showByAddress() {
	
	var address = "ShanthiNagar, MasabTank";
	if(address.length==0) address = "Hyderabad";
	$(".propAddress").html(address);
	geocoder.geocode( { 'address': address}, function(results, status) {
	  if (status == google.maps.GeocoderStatus.OK) {
		map.setCenter(results[0].geometry.location);
		map.setZoom(11);
		var marker = new google.maps.Marker({
			map: map,
			position: results[0].geometry.location
		});
		infowindow.setContent(results[0].formatted_address);
		infowindow.open(map, marker);
	  } else {
		alert('Geocode was not successful for the following reason: ' + status);
	  }
	});
}
</script>
		
		</div></td></tr>
		</table>
	</div>
</div>
<style type="text/css">
input[type="text"] {
	width: 250px;
}
.gmap {
	
	
	width: 350px;
	height: 350px;
	border: 1px solid #000;
}
</style>
<style>
.imag{
width:500px;
}
</style>
</body>