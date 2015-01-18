
gulp = require 'gulp'

tasks = [
	'compile',
	'clean',
	'server',
	'watch',
	]

for task in tasks
	require "./gulp/tasks/#{task}"

# サーバー起動して更新監視
gulp.task 'dev', ->
	# 開発用の値
	global.isProd = false
	gulp.start 'server', 'watch'

# 全てまっさらにしてから開始
gulp.task 'clean-dev', ->
	gulp.start 'clean', 'compile', 'dev'

# デフォルト
gulp.task 'default', ->
	gulp.start 'dev'