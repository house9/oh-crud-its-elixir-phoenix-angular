'use strict';

class ProjectsShowController {
  constructor ($scope, $state, $stateParams) {
    // debugger
    $scope.product = $scope.products.find(function (item) {
      return item.id === $stateParams.id;
    });
  }
}

ProjectsShowController.$inject = ['$scope', '$state', '$stateParams'];

export default ProjectsShowController;
