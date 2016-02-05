 var ManolisApp = angular.module('ManolisApp', ['ngRoute','google-maps', 'wu.masonry']);
 //---------------------------------------------------------------//
 //Manolis Application Controllers
 //---------------------------------------------------------------//
 // Main Controller
 ManolisApp.controller("MainCtrl", function($scope){
 	$scope.val = "test1234"
 });
 //Header Controller
ManolisApp.controller("HeaderCtrl", function($scope){
	$scope.navItems = [
			{"id": 0, "name": "Η Ταβέρνα", "url": ""},
			{"id": 1, "name": "Κατάλογος", "url": "catalog"},
			{"id": 2, "name": "Φωτογραφίες", "url": "photos"},
			{"id": 3, "name": "Επικοινωνία", "url": "contact"}
	];
})
// Intro Controller
ManolisApp.controller("IntroCtrl", function($scope){
	$scope.title = "This is The Intro Partial"
})
// About Controller
ManolisApp.controller("AboutCtrl", function($scope){
	$scope.title = "This is The About Partial"
})
// Recommend Controller
ManolisApp.controller("recommendCtrl", function($scope){
	$scope.title = "This is a Recommend Partial"
})
// Responsive Controller
ManolisApp.controller("ResponsiveCtrl", function($scope){
	$scope.title = "This is The Responsive Partial"
})
// Catalog Controller
ManolisApp.controller("CatalogCtrl", function($scope, $http){
	$http.get('/api/v1/categories').
	success(function(data, status, headers, config) {
      $scope.categories = data;
    }).
    error(function(data, status, headers, config) {
      // log error
    });
});
// Photos Controller
ManolisApp.controller("PhotosCtrl", function($scope, $http){
    $http.get('/api/v1/photos').
        success(function(data, status, headers, config) {
            $scope.photos = data;
        }).
        error(function(data, status, headers, config) {
            // log error
        });
});
ManolisApp.controller("GalleryCtrl", function($scope){
	$scope.title = "This is a Gallery Partial"
})
// iphone Controller
ManolisApp.controller("iphoneCtrl", function($scope){
	$scope.title = "This is the iphone Partial"
})
// Contact Controller
ManolisApp.controller("ContactCtrl", function($scope){
	$scope.title = "This is the contact Partial"
})
// Map Controller
ManolisApp.controller("MapCtrl", function($scope){
	$scope.map = {center: {latitude: 38.03050, longitude: 23.80650 }, zoom: 18 };
    $scope.options = {scrollwheel: false};
    $scope.marker = {
            coords: {
                latitude: 38.03050,
                longitude: 23.80650
            },
            show: false
        };

        $scope.title = "Window Title!";
})
// Footer Controller
ManolisApp.controller("FooterCtrl", function($scope){
	$scope.title = "This is the Footer Partial"
})
//---------------------------------------------------------------//
 //Manolis Application Routes
 //---------------------------------------------------------------//

ManolisApp.config(function($routeProvider){
	$routeProvider
	.when('/', {
			templateUrl: 'assets/templates/site/index.html'
	})
	.when ('/catalog', {
		templateUrl: 'assets/templates/site/catalog.html'
	})
	.when ('/photos',{
		templateUrl: 'assets/templates/site/photos.html'
	})
	.when('/contact', {
        templateUrl: 'assets/templates/site/contact.html'
      })
    .otherwise({
        templateUrl: 'assets/templates/site/404.html'
      })
});