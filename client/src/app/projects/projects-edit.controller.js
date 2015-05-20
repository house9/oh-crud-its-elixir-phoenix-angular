'use strict';

class ProjectsEditController {
  constructor ($scope, $state, project, projectsResource) {
    $scope.project = project;

    $scope.editProject = function () {
      project.put().then(function (data) {
        $state.go('projects.index')
      });
    }
  }
}

ProjectsEditController.$inject = ['$scope', '$state', 'project', 'projectsResource'];

export default ProjectsEditController;
