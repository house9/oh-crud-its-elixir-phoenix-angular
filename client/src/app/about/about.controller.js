'use strict';

class AboutController {
  constructor ($scope) {
    $scope.awesomeThings = [
      {
        'title': 'AngularJS',
        'url': 'https://angularjs.org/',
        'description': 'HTML enhanced for web apps!',
        'logo': 'angular.png'
      }
    ];

    $scope.awesomeThings.forEach(function(awesomeThing) {
      awesomeThing.rank = Math.random();
    });
  }
}

AboutController.$inject = ['$scope'];

export default AboutController;
