'use strict';

/**
 * @ngInject
 */
function ExampleService($q, $http, AppSettings) {

	var service = {};
	service.get = function() {
		// 非同期処理用
		var deferred = $q.defer();

		$http.get( AppSettings.apiUrl01 ).success(function(data) {
			// 成功
			deferred.resolve(data);
		}).error(function(err, status) {
			// 失敗
			deferred.reject(err, status);
		});

		// promiseに関してはこちらなどを参照 → http://dev.classmethod.jp/client-side/javascript/angularjs-q-promise/
		return deferred.promise;
	};
	return service;
}

module.exports = ExampleService;