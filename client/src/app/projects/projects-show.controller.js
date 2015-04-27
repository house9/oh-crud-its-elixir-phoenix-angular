'use strict';

class ProjectsShowController {
  constructor ($scope, project) {
    $scope.project = project;
  }
}

ProjectsShowController.$inject = ['$scope', 'project'];

export default ProjectsShowController;
