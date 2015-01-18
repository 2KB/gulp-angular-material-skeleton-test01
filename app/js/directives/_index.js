'use strict';

var angular = require('angular');

var directivesModule = angular.module('app.directives', []);

// Define the list of directives here
// ここの登録は小文字じゃないとダメ。
directivesModule.directive('exampleDirective', require('./example.js'));