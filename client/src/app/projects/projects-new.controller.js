'use strict';

class ProjectsNewController {
  constructor ($scope, $state, projectsResource) {
    $scope.project = {}; // TODO: init from projectsResource?

    $scope.createProject = function () {
      projectsResource.post($scope.project).then(function (data) {
        $state.go('projects.index')
      });
    }
  }
}

ProjectsNewController.$inject = ['$scope', '$state', 'projectsResource'];

export default ProjectsNewController;
