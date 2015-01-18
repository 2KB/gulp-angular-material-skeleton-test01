'use strict';

var angular = require('angular');

var controllersModule = module.exports = angular.module('app.controllers', []);

// 必要なコントローラーを全て登録
controllersModule.controller('common/headCtrl', require('./common/headCtrl'));

controllersModule.controller('homeCtrl', require('./homeCtrl.js'));
controllersModule.controller('detailCtrl', require('./detailCtrl.js'));
