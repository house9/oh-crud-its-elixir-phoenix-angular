'use strict';

class ProjectsIndexController {
  constructor ($scope, projects) {
    $scope.projects = projects;
  }
}

ProjectsIndexController.$inject = ['$scope', 'projects'];

export default ProjectsIndexController;
