'use strict';

import MainCtrl from './main/main.controller';
import AboutController from './about/about.controller';
import ProjectsIndexController from './projects/projects-index.controller';
import ProjectsShowController from './projects/projects-show.controller';
import NavbarCtrl from '../app/components/navbar/navbar.controller';

angular.module('ohCrud', ['ngAnimate', 'ngCookies', 'ngTouch', 'ngSanitize', 'restangular', 'ui.router', 'ui.bootstrap'])
  .controller('AboutController', AboutController)
  .controller('ProjectsIndexController', ProjectsIndexController)
  .controller('ProjectsShowController', ProjectsShowController)
  .controller('MainCtrl', MainCtrl)
  .controller('NavbarCtrl', NavbarCtrl)

  .factory('projectsResource', function (Restangular) {
    return Restangular.service('projects');
  })

  .config(function ($stateProvider, $urlRouterProvider, RestangularProvider) {
    RestangularProvider.setBaseUrl('http://localhost:4000/api');

    $stateProvider
      .state('about', {
        url: '/about',
        templateUrl: 'app/about/about.html',
        controller: 'AboutController'
      })
      .state('projects', {
        url: '/projects',
        templateUrl: 'app/projects/index.html',
        controller: 'ProjectsIndexController',
        resolve: {
          projectsResource: 'projectsResource',
          projects: function(projectsResource) {
            return projectsResource.getList(); //.$promise;
          }
        }
      })
      // .state('projects.show', {
      //   url: '/:id',
      //   views: {
      //     'show': {
      //       templateUrl: 'app/projects/show.html',
      //       controller: 'ProjectsShowController'
      //     }
      //   }
      // })
      .state('home', {
        url: '/',
        templateUrl: 'app/main/main.html',
        controller: 'MainCtrl'
      });

    $urlRouterProvider.otherwise('/');
  })
;
