# GooglePlacesSearchController

[![CI Status](http://img.shields.io/travis/Dmitry Shmidt/GooglePlacesSearchController.svg?style=flat)](https://travis-ci.org/Dmitry Shmidt/GooglePlacesSearchController)
[![Version](https://img.shields.io/cocoapods/v/GooglePlacesSearchController.svg?style=flat)](http://cocoapods.org/pods/GooglePlacesSearchController)
[![License](https://img.shields.io/cocoapods/l/GooglePlacesSearchController.svg?style=flat)](http://cocoapods.org/pods/GooglePlacesSearchController)
[![Platform](https://img.shields.io/cocoapods/p/GooglePlacesSearchController.svg?style=flat)](http://cocoapods.org/pods/GooglePlacesSearchController)


A simple [Google Places API](https://developers.google.com/places/documentation/autocomplete) autocompleting address search controller (subclass of ```UISearchController```) for iOS devices.

GooglePlacesAutocomplete is 100% Swift, and is a fork of https://github.com/watsonbox/ios_google_places_autocomplete.

No attempt has been made to integrate MapKit since displaying Google Places on a non-Google map is against their terms of service.

___

## Screenshots
<table width="100%">
  <tr>
    <td align="left"><img src="Screenshots/view.png"/></td>
    <td align="right"><img src="Screenshots/search.png"/></td>
  </td>
</table>

----------

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 8.0+
XCode 6.2+ / Swift 1.2

## Installation

GooglePlacesSearchController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "GooglePlacesSearchController"
```


##Usage
```swift
var controller: GooglePlacesSearchController!
controller = GooglePlacesAutocomplete(
    apiKey: "YOUR_GOOGLE_MAPS_SERVER_KEY",
    placeType: PlaceType.Address
)
```
        
Or with specified region

```swift
var controller: GooglePlacesSearchController!

let coord = CLLocationCoordinate2D(latitude: 55.751244, longitude: 37.618423)
controller = GooglePlacesAutocomplete(
    apiKey: "YOUR_GOOGLE_MAPS_SERVER_KEY",
    placeType: PlaceType.Address,
    coordinate: coord,
    radius: 10
)
```

And then add controller's searchbar ```controller.searchBar``` to your view.

To get selected place use closure
```swift
controller.didSelectGooglePlace { (place) -> Void in
    println(place.description)
} 
```

##Other

Looking for a job as an iOS developer in USA. Legal resident, currently live in San Jose, CA.

## Author

Dmitry Shmidt, dima.shmidt@gmail.com

## License

GooglePlacesSearchController is available under the MIT license. See the LICENSE file for more info.
