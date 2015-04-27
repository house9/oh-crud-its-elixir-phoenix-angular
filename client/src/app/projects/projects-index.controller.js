'use strict';

class ProjectsIndexController {
  constructor ($scope, projects) {
    // ProjectsResource.getList().then(function (projects) {
    //   $scope.projects = projects;
    // });

    $scope.projects = projects;
  }
}

ProjectsIndexController.$inject = ['$scope', 'projects'];

export default ProjectsIndexController;
