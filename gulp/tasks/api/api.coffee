gulp = require 'gulp'
coffee = require 'gulp-coffee'

browserSync = require 'browser-sync'

config = require '../../config'

# server起動。apimockも一緒に起動
gulp.task 'server', ['compile:apimock'], ->
	gulp.start 'watch', 'watch:apimock'
	nodemon
		script: 'target/apimock.js'
		watch: ['target/apimock.js', 'target/webapp/']
		env:
			port: 8888
			webapp: "#{__dirname}/target/webapp/"

gulp.task 'watch:apimock', ->
	gulp.watch 'apimock.coffee', ['compile:apimock']

gulp.task 'compile:apimock', ->
	gulp.src 'apimock.coffee'
		.pipe coffee()
		.pipe gulp.dest config.dist.dir
