'use strict';

/* Controllers */

var crmControllers = angular.module('crmControllers', []);

crmControllers.controller('CardsListCtrl', ['$scope', '$http', 'Cards', 'Generate',
    function ($scope, $http, Cards, Generate) {
        $scope.cards = Cards.query();
        $scope.generate = function() {
            Generate.save({}, $scope.generator, function(res) {
                console.log('Сгенерировано');
                $scope.cards = Cards.query();
            })
        }
    }]);

crmControllers.controller('CardDetailCtrl', ['$scope', '$http', 'Cards', 'Card_history', '$routeParams', '$location',
    function ($scope, $http, Cards, Card_history, $routeParams, $location) {

        //Получение бонусной карты
        $scope.card = Cards.get({card_number: $routeParams.card_number});

        //Получение истории по карте
        $scope.card_history = Card_history.query({card_number: $routeParams.card_number});

        $scope.delete = function () {
            Cards.delete({card_number: $scope.card.card_number}, function (res) {
                alert('Карта удалена');
                $location.path("/cards");
            });
        }

        $scope.updateStatus = function () {
            if ($scope.card.status == 'deactivated') {
                $scope.card.status = 'activated';

                Cards.update({card_number: $scope.card.card_number}, {status: $scope.card.status}, function (res) {
                    console.log('Изменен статус карты');
                });
            } else if ($scope.card.status == 'activated') {
                $scope.card.status = 'deactivated';
                Cards.update({card_number: $scope.card.card_number}, {status: $scope.card.status}, function (res) {
                    console.log('Изменен статус карты');
                });
            }
        };
    }]);
