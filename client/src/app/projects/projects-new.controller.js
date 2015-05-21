'use strict';

class ProjectsNewController {
  constructor ($scope, $state, projectsResource, departments) {
    $scope.project = {}; // TODO: init from projectsResource?
    $scope.departments = departments;

    $scope.createProject = function () {
      projectsResource.post($scope.project).then(function (data) {
        $state.go('projects.index')
      });
    }
  }
}

ProjectsNewController.$inject = ['$scope', '$state', 'projectsResource', 'departments'];

export default ProjectsNewController;
