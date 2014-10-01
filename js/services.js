var crmServices = angular.module('crmServices', ['ngResource']);

crmServices.factory('Cards', ['$resource',
    function ($resource) {
        return $resource('api/cards/:card_number', {}, {
            query: {method: 'GET', isArray: true},
            get: {method: 'GET', isArray: false},
            save: {method: 'POST'},
            update: {method: 'PUT'},
            delete: {method: 'DELETE'}
        });
    }]);

crmServices.factory('Card_history', ['$resource',
    function ($resource) {
        return $resource('api/card_history/:card_number', {}, {
            query: {method: 'GET', isArray: true}
        });
    }]);

crmServices.factory('Generate', ['$resource',
    function ($resource) {
        return $resource('api/generate', {}, {
            save: {method: 'POST'}
        });
    }]);
