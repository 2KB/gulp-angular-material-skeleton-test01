'use strict';

/**
 * Home用のコントローラー
 * 
 * @ngInject
 */
function HomeCtrl($scope, exampleService) {
	
	// ViewModelとして扱う(thisだと他の関数内で使いづらい)
	var vm = this;
	vm.title = 'Home';
	vm.number = 1234;

	vm.alert = function(message) {
		alert(message);
	};
	
	vm.serviceData = {};
	
	// 初期データ取得
	exampleService.get().then(
		// 成功時の処理
		function(data){
			vm.serviceData = data;
		},
		// 失敗時の処理
		function(reason){
			alert(reason);
		}
	);
}

module.exports = HomeCtrl;