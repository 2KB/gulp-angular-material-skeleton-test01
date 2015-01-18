gulp = require 'gulp'
browserSync = require 'browser-sync'

config = require '../config'

# browser-syncでサーバー起動
gulp.task 'server', ->
	browserSync(
		port: config.server.port
		server: {
			baseDir: config.dist.dir
		}
	)

# browser-syncに更新の指令を出す
gulp.task 'reload', ->
	browserSync.reload()
