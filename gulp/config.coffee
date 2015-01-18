'use strict';

config = 
	sources :
		bower :  'bower.json'
		static : 'static/**/*'
		js : './app/js/**/*.js'
		css : 'app/styles/**/*.css'
		view : 'app/views/**/*.html'
		appJs : './app/js/main.js'

	dist :
		dir : 'build'
		libJs : 'lib.js'
		libCss : 'lib.css'
		appJs : 'app.js'
		appCss : 'app.css'
	
	# ライブラリパス
	libs :
		js : [
			'hammerjs/hammer.min.js'
			'angular/angular.min.js'
			'angular-animate/angular-animate.min.js'
			'angular-aria/angular-aria.min.js'
			'angular-material/angular-material.min.js'
			'angular-ui-router/release/angular-ui-router.min.js'
		]
		css :    [
			'angular-material/angular-material.min.css'
		]
		static : [
			'angular/angular.min.js.map'
			'angular-aria/angular-aria.min.js.map'
		]
	
	server :
		port : 8000
		homeFile : 'index.html'

module.exports = config