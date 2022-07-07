angular.module('market-front').controller('regPageController', function ($rootScope, $scope, $http, $localStorage, $location) {
    const contextPath = 'http://localhost:8189/market/api/v1';


        $scope.createAndAuthNewUser = function () {
            if ($scope.new_user == null) {
                alert("Форма не заполнена");
                return;
            }
            $http.post(contextPath + '/users', $scope.new_user)
                .then(function successCallback(response) {
                        $scope.tryToAuthNew();
                        $scope.new_user = null;

                    }, function failCallback(response) {
                        alert(response.data.messages);
                    }
                );
        }


    $scope.tryToAuthNew = function () {
        $http.post(contextPath + '/auth', $scope.new_user)
            .then(function successCallback(response) {
                if (response.data.token) {
                    $http.defaults.headers.common.Authorization = 'Bearer ' + response.data.token;
                    $localStorage.webMarketUser = {username: $scope.new_user.username, token: response.data.token};
                    $scope.new_user.username = null;
                    $scope.new_user.password = null;
                    $location.path('/store');
                }
            }, function errorCallback(response) {
                alert(response.data.messages);
            });
    };




});