var app = angular.module('flapperNews', [
        'ui.router'
]);

app.config([
    '$stateProvider',
    '$urlRouterProvider',
    function($stateProvider, $urlRouterProvider) {

        $stateProvider
            .state('home', {
                url: '/home',
                templateUrl: '/home.html',
                controller: 'MainCtrl',
                resolve: {
                    rentalPromise: ['rentalRepository', function(rentalRepository){
                        return rentalRepository.getAll();
                    }]
                }
            })

            .state('rentals', {
                url: '/rentals/{id}',
                templateUrl: '/rentals.html',
                controller: 'RentalsCtrl',
                resolve: {
                    rental: ['$stateParams', 'rentalRepository', function($stateParams, rentalRepository) {
                        return rentalRepository.get($stateParams.id);
                    }]
                }
            });

        $urlRouterProvider.otherwise('home');
    }
]);

app.factory('rentalRepository', ['$http', function($http){
    var o = {
        rentals: []
    };

    o.get = function(id) {
        return $http.get('/rentals/' + id).then(function(res){
            return res.data;
        });
    };

    o.getAll = function() {
        return $http.get('/rentals').success(function(data){
            angular.copy(data, o.rentals);
        });
    };

    o.create = function(rental) {
        return $http.post('/rentals', rental).success(function(data){
            o.rentals.push(data);
        });
    };

    o.remove = function(rental) {
        return $http.delete('/rentals', rental).success(function(data){
            console.log("deleted");
        });
    };

    o.addReview = function(id, review) {
        return $http.post('/rentals/' + id + '/reviews', review);
    };

    return o;
}]);

app.controller('MainCtrl', [
    '$scope',
    'rentalRepository',
    function($scope, rentalRepository){
        $scope.test = 'Hello world!';

        $scope.rentals = rentalRepository.rentals;
        console.log("here");

        $scope.addRental = function(){
            if(!$scope.full_street_add || $scope.full_street_add === '') { 
               console.log("here");
               return;
            }
            console.log("here");
            rentalRepository.create({
              address: {
                full_street_add : $scope.full_street_add,
                street_num : $scope.street_num,
                street_name : $scope.street_name,
                zip_code : $scope.zip_code,
                city : $scope.city,
                country : $scope.country
              },
              details: {
                bedrooms : $scope.bedrooms,
                bathrooms : $scope.bathrooms,
                is_complex : $scope.is_complex,
                stories : $scope.stories,
                company_owned : $scope.company_owned,
                owner : $scope.owner
              },
              amenities: {
                parking : $scope.parking,
                pets : $scope.pets,
                washer_dryer : $scope.washer_dryer,
                pool: $scope.pool,
                spa: $scope.spa,
                gym: $scope.gym,
                dishwasher: $scope.dishwasher,
                central_air: $scope.central_air,
                heater: $scope.heater
              },
              utilities: {
                gas: $scope.gas,
                electricity: $scope.electricity,
                trash: $scope.trash,
                water: $scope.water,
                tv: $scope.tv,
                wifi: $scope.wifi
              }
            });
            console.log($scope.full_street_add + " -- what");
            $scope.full_street_add = '';
            $scope.street_num = '';
            $scope.street_name = '';
            $scope.zip_code = '';
            $scope.city = '';
            $scope.country = '';
            $scope.bedrooms = '';
            $scope.bathrooms = '';
            $scope.is_complex = false;
            $scope.company_owned = false;
            $scope.owner = '';
            $scope.parking = false;
            $scope.pets = false;
            $scope.washer_dryer = false;
            $scope.pool = false;
            $scope.spa = false;
            $scope.gym = false;
            $scope.dishwasher = false;
            $scope.central_air = false;
            $scope.heater = false;
            $scope.gas = false;
            $scope.electricity = false;
            $scope.trash = false;
            $scope.water = false;
            $scope.tv = false;
            $scope.wifi = false;
        };

        $scope.removeRental = function (rental) {
           rentalRepository.remove(rental._id).success(function() {
              for (i = 0; i < rentalRepository.rentals.length; i++) {
                 if (rentalRepository.rentals[i]._id == rental._id) {
                    rentalRepository.rentals.splice(i, 1);
                 }
              }
           });
        };


    }
]);

app.controller('RentalsCtrl', [
    '$scope',
    'rentalRepository',
    'rental',
    function($scope, rentalRepository, rental){
        $scope.rental = rental;

        $scope.addReview = function(){
            if($scope.body === '') { return; }
            rentalRepository.addReview(rental._id, {
                overall: $scope.overall,
                neighborhood_safety: $scope.neighborhood_safety,
                clean_level: $scope.clean_level,
                noise_level: $scope.noise_level,
                price: $scope.price,
                comment: $scope.comment
            }).success(function(review) {
                $scope.rental.reviews.push(review);
            });
            $scope.overall = '';
            $scope.neighborhood_safety = '';
            $scope.clean_level = '';
            $scope.noise_level = '';
            $scope.price = '';
            $scope.comment = '';
        };

    }
]);
