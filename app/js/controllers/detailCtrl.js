'use strict';

/**
 * Detail用のコントローラー
 * 
 * @ngInject
 */
function DetailCtrl() {
	var vm = this;
	vm.title = 'Detail';

	vm.alert = function(message) {
		alert(message);
	};
}

module.exports = DetailCtrl;