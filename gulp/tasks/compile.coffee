
gulp = require 'gulp'

tasks = [
	'lib',
	'script',
	'static',
	'style',
	]

for task in tasks
	require "./compiles/#{task}"

# compile系全部
gulp.task 'compile', ->
  gulp.start 'compile:lib', 'compile:script', 'compile:static', 'compile:style'

