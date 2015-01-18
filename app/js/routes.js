'use strict';

/**
 * @ngInject
 */
function Routes($stateProvider, $locationProvider, $urlRouterProvider) {

	$locationProvider.html5Mode(true);

	$stateProvider
		.state('Home', {
			url: '/',
			views:{
				headView : {
					controller: 'common/headCtrl as head',
					templateUrl: 'common/head.html'
				},
				mainView : {
					controller: 'homeCtrl as home',
					templateUrl: 'home.html',
					title: 'Home'
				}
			}
		})
		.state('Detail', {
			url: '/detail',
			views:{
				headView : {
					controller: 'common/headCtrl as head',
					templateUrl: 'common/head.html'
				},
				mainView : {
					controller: 'DetailCtrl as detail',
					templateUrl: 'detail.html',
					title: 'detail'
				}
			}
		});	

	$urlRouterProvider.otherwise('/');

}

module.exports = Routes;