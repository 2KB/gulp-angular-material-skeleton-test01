'use strict';

var angular = require('angular');

var servicesModule = angular.module('app.services', []);

// Define the list of services here
servicesModule.service('exampleService', require('./example.js'));