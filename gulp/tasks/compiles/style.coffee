
gulp = require 'gulp'
concat = require 'gulp-concat'
less = require 'gulp-less'

config = require '../../config'

# style系をコンパイル
gulp.task 'compile:style', ->
	gulp.start 'compile:css'


# cssをコンパイルして app.css にまとめる
gulp.task 'compile:css', ->
	gulp.src config.sources.css
		.pipe concat config.dist.appCss
		.pipe gulp.dest config.dist.dir



# lessをコンパイルして app.less.css にまとめる
gulp.task 'compile:less', ->
	gulp.src sources.less
		.pipe less()
		.pipe concat 'app.less.css'
		.pipe gulp.dest 'target/webapp/'