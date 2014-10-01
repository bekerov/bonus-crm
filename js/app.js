'use strict';

/* App Module */

var crmApp = angular.module('crmApp', [
    'ngRoute',
    'crmControllers',
    'crmServices'
]);

crmApp.config(['$routeProvider',
    function ($routeProvider) {
        $routeProvider.
            when('/cards', {
                templateUrl: 'templates/cards-list.html',
                controller: 'CardsListCtrl'
            }).
            when('/card/:card_number', {
                templateUrl: 'templates/card-detail.html',
                controller: 'CardDetailCtrl'
            }).
            otherwise({
                redirectTo: '/cards'
            });
    }]);
