var map;
function initMap() {


    var collegeLatLng = { lat: 4.885731, lng: 114.931669 };
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 19,
        center: collegeLatLng
    });

    var contentString1 = '<div id="content">' +
        '<div id="siteNotice">' +
        '</div>' +
        '<h1 id="firstHeading" class="firstHeading">Laksamana College of Business</h1>' +
        '<div id="bodyContent">' +
        '<p><b>College located here!</b></p>' +
        '</div>' +
        '</div>';

    var infowindow1 = new google.maps.InfoWindow({
        content: contentString1
    });


    var marker1 = new google.maps.Marker({
        position: collegeLatLng,
        map: map,
        title: 'Laksamana College of Business'
    });
    marker1.addListener('click', function () {
        infowindow1.open(map, marker1);
    });
}
    </script >
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA3Jd9nrI76Iz0Nl3qA4sHLh4eF02sVTM8&callback=initMap"
        async defer>