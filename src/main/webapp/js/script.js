const createMap = ({ lat, lng }) => {
    return new google.maps.Map(document.getElementById('map'), {
        center: { lat, lng },
        zoom: 15,
        zoomControl: true,
        mapTypeControl: false,
        scaleControl: false,
        streetViewControl: false,
        rotateControl: false,
        fullscreenControl: false,
        mapTypeId: 'roadmap'
    });
};


// Creates a new marker and sets it to the position given...
const createMarker = ({ map, position }) => {
    return new google.maps.Marker({ map, position });
};


// Get proper error message based on the code.
const getPositionErrorMessage = code => {
    switch (code) {
        case 1:
            return 'Permission denied.';
        case 2:
            return 'Position unavailable.';
        case 3:
            return 'Timeout reached.';
        default:
            return null;
    }
};


// New function to track user's location.
const trackLocation = ({ onSuccess, onError = () => { } }) => {
    if ('geolocation' in navigator === false) {
        return onError(new Error('Geolocation is not supported by your browser.'));
    }

    // Use watchPosition instead.
    return navigator.geolocation.watchPosition(onSuccess, onError, {
        enableHighAccuracy: true,
        timeout: 5000,
        maximumAge: 0
    });
};


function initialize() {
    // This sets the initial position...I would like to change this to later retrieve the initial position based on the user's address...
    const initialPosition = {lat: 47.595639, lng: -122.192972};
    // This creates the instance of the map...
    const map = createMap(initialPosition);
    // This sets the info div to show the position coords or error messages...i want to rework this later...I don't care about showing the coords...
    const $info = document.getElementById('info');
    // This runs the code to actually retrieve the user's current tracked position...
    trackLocation({
        onSuccess: ({coords: {latitude: lat, longitude: lng}}) => {
            // Move the map to the position...
            map.panTo({lat, lng});
        },
        onError: err => {
            // Print out the error message.
            $info.textContent = `Error: ${getPositionErrorMessage(err.code) || err.message}`;
            // Add error class name.
            $info.classList.add('error');
        }
    });
    var clickHandler = new ClickEventHandler(map, origin);

    // Create the search box and link it to the UI element.
    var input = document.getElementById('pac-input');
    var searchBox = new google.maps.places.SearchBox(input);

    // Bias the SearchBox results towards current map's viewport.
    map.addListener('bounds_changed', function() {
        searchBox.setBounds(map.getBounds());
    });

    // Listen for the event fired when the user selects a prediction and retrieve
    // more details for that place.
    searchBox.addListener('places_changed', function() {
        var places = searchBox.getPlaces();

        if (places.length == 0) {
            return;
        }

        // For each place, get the name and location.
        var bounds = new google.maps.LatLngBounds();
        places.forEach(function(place) {
            if (!place.geometry) {
                console.log("Returned place contains no geometry");
                return;
            }

            if (place.geometry.viewport) {
                // Only geocodes have viewport.
                bounds.union(place.geometry.viewport);
            } else {
                bounds.extend(place.geometry.location);
            }
        });
        map.fitBounds(bounds);
    });
}

var ClickEventHandler = function(map, origin) {
    this.origin = origin;
    this.map = map;
    this.placesService = new google.maps.places.PlacesService(map);
    // Listen for clicks on the map.
    this.map.addListener('click', this.handleClick.bind(this));
};

ClickEventHandler.prototype.handleClick = function(event) {
    const $card = document.getElementById('card');
    // If the event has a placeId, use it.
    if (event.placeId) {
        console.log('You clicked on place:' + event.placeId);
        // Calling e.stop() on the event prevents the default info window from
        // showing. If you call stop here when there is no placeId you will prevent some
        // other map click event handlers from receiving the event.
        event.stop();
        this.getPlaceInformation(event.placeId);
    } else {
        $card.classList.replace("show", "hide");
    }
};

ClickEventHandler.prototype.getPlaceInformation = function(placeId) {
    const $card = document.getElementById('card');
    var me = this;
    this.placesService.getDetails({placeId: placeId}, function (place, status) {
        if (status === 'OK') {
            document.getElementById('placeHeader').textContent = place.name;
            document.getElementById('placeAddress').textContent = place.formatted_address;
            $.post('/getReviews',
                {hiddenId: place.place_id, hiddenName: place.name, hiddenAddress: place.formatted_address},
                function() {
                    alert('This ran, but did it work?');
                },
                'none');
            $('#overallRating').load(document.URL +  ' #overallRating');
            $('#allReviews').load(document.URL +  ' #allReviews');
            $('#cardBody').load(document.URL +  ' #cardBody');
        }
        $card.classList.replace("hide", "show");
        document.getElementById('placeHeader').textContent = place.name;
        document.getElementById('placeAddress').textContent = place.formatted_address;
    });
};