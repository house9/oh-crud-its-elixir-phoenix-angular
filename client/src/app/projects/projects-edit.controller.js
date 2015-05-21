'use strict';

class ProjectsEditController {
  constructor ($scope, $state, project, projectsResource, departments) {
    console.log(project);
    $scope.project = project;
    console.log(departments);
    $scope.departments = departments;

    $scope.editProject = function () {
      project.put().then(function (data) {
        $state.go('projects.index')
      });
    }
  }
}

ProjectsEditController.$inject = ['$scope', '$state', 'project', 'projectsResource', 'departments'];

export default ProjectsEditController;
