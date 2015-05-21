'use strict';

import MainCtrl from './main/main.controller';
import AboutController from './about/about.controller';
import ProjectsNewController from './projects/projects-new.controller';
import ProjectsIndexController from './projects/projects-index.controller';
import ProjectsShowController from './projects/projects-show.controller';
import ProjectsEditController from './projects/projects-edit.controller';
import NavbarCtrl from '../app/components/navbar/navbar.controller';

angular.module('ohCrud', ['ngAnimate', 'ngCookies', 'ngTouch', 'ngSanitize', 'restangular', 'ui.router', 'ui.bootstrap'])
  .controller('AboutController', AboutController)
  .controller('ProjectsNewController', ProjectsNewController)
  .controller('ProjectsIndexController', ProjectsIndexController)
  .controller('ProjectsShowController', ProjectsShowController)
  .controller('ProjectsEditController', ProjectsEditController)
  .controller('MainCtrl', MainCtrl)
  .controller('NavbarCtrl', NavbarCtrl)

  .factory('projectsResource', function (Restangular) {
    return Restangular.service('projects');
  })
  .factory('departmentsResource', function (Restangular) {
    return Restangular.service('departments');
  })

  .config(function ($stateProvider, $urlRouterProvider, RestangularProvider) {
    RestangularProvider.setBaseUrl('http://localhost:4000/api');
    // https://github.com/mgonto/restangular/issues/109
    RestangularProvider.addRequestInterceptor(function (elem, operation, what) {
      if (operation === 'post' || operation === 'put') {
        var wrapper = {};
        wrapper[what.substring(0, what.length -1)] = elem;
      }
      return wrapper;
    });

    $stateProvider
      .state('about', {
        url: '/about',
        templateUrl: 'app/about/about.html',
        controller: 'AboutController'
      })
      .state('projects', {
        abstract: true,
        url: '/projects',
        templateUrl: 'app/projects/container.html'
      })
      .state('projects.new', {
        url: '/new',
        templateUrl: 'app/projects/new.html',
        controller: 'ProjectsNewController',
        resolve: {
          departmentsResource: 'departmentsResource',
          departments: function(departmentsResource) {
            return departmentsResource.getList();
          }
        }
      })
      .state('projects.index', {
        url: '/index',
        templateUrl: 'app/projects/index.html',
        controller: 'ProjectsIndexController',
        resolve: {
          projectsResource: 'projectsResource',
          projects: function(projectsResource) {
            return projectsResource.getList();
          }
        }
      })
      .state('projects.show', {
        url: '/:id',
        templateUrl: 'app/projects/show.html',
        controller: 'ProjectsShowController',
        resolve: {
          projectsResource: 'projectsResource',
          project: function(projectsResource, $stateParams) {
            return projectsResource.one($stateParams.id).get();
          }
        }
      })
      .state('projects.edit', {
        url: '/:id/edit',
        templateUrl: 'app/projects/edit.html',
        controller: 'ProjectsEditController',
        resolve: {
          departmentsResource: 'departmentsResource',
          departments: function(departmentsResource) {
            return departmentsResource.getList();
          },
          projectsResource: 'projectsResource',
          project: function(projectsResource, $stateParams) {
            return projectsResource.one($stateParams.id).get();
          }
        }
      })
      .state('home', {
        url: '/',
        templateUrl: 'app/main/main.html',
        controller: 'MainCtrl'
      });

    $urlRouterProvider.otherwise('/');
  })
;
