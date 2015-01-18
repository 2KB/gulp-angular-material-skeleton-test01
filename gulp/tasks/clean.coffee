
gulp = require 'gulp'
del = require 'del'

config = require '../config'

# distディレクトリの中身を削除
gulp.task 'clean', ->
	del config.dist.dir