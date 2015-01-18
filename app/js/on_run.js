'use strict';

/**
 * @ngInject
 */
function OnRun($rootScope, AppSettings) {

	// stateが変わった時の処理を登録
	$rootScope.$on('$stateChangeSuccess', function(event, toState) {

		$rootScope.pageTitle = "";
		
		// タイトルがあればそれをベースとして使用する
		if ( toState.title ) {
			$rootScope.pageTitle += toState.title;
			$rootScope.pageTitle += ' \u2014 ';
		}

		// デフォルトのタイトルを追加
		$rootScope.pageTitle += AppSettings.appTitle;
	});

}

module.exports = OnRun;