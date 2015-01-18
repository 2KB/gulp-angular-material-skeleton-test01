'use strict';

var angular = require('angular');

// angular modules
require('angular-ui-router');
require('./templates');
require('./controllers/_index');
require('./services/_index');
require('./directives/_index');

// create and bootstrap application
angular.element(document).ready(function() {

	// 必要なangular.module一覧
	var requires = [
			// angular-ui-router
			'ui.router',
			// views.jsでコンパイルしたtemplates.jsで登録した templetesを読み込む
			'templates',
			// angular-material-ui
			'ngMaterial',
			// 自分で作ったコントローラー、サービス、ディレクティブを読み込む
			'app.controllers', 'app.services', 'app.directives'
	];

	// window全体をAngular化(HTMLの方に記載する場合は不要？)
	window.app = angular.module('app', requires);

	// 定数読み込み(環境によって分ける)
	if(global.isProd){
		angular.module('app').constant('AppSettings', require('./settings/constants_prod'));
	}else{
		angular.module('app').constant('AppSettings', require('./settings/constants_dev'));
	}

	// angularの実行フェーズは2段階あります。config と run です。それぞれ注入できるサービスが違います。この表が分かりやすいです。
	// https://docs.angularjs.org/guide/providers#conclusion
	angular.module('app').config(require('./routes'));

	// 初期化処理とか？
	angular.module('app').run(require('./on_run'));

	// 手動で実行
	angular.bootstrap(document, [
		'app'
	]);

});