gulp           = require('gulp')
gutil          = require('gulp-util')
concat         = require('gulp-concat')
compass        = require('gulp-compass')
sass           = require('gulp-sass')
coffee         = require('gulp-coffee')
coffeelint     = require('gulp-coffeelint');
minifyHTML     = require('gulp-minify-html')
clean          = require('gulp-clean')
uglify         = require('gulp-uglify')
minifyCss      = require('gulp-minify-css')
rename         = require('gulp-rename')
livereload     = require('gulp-livereload')
open           = require('gulp-open')
connect        = require('gulp-connect')
gulpBowerFiles = require('gulp-bower-files');
bowerSrc       = require('gulp-bower-src');
sh             = require('shelljs');
browserSync    = require('browser-sync')

paths = src: ['./src/**']
paths = www: ['./www/**']
paths = sass: ['./src/scss/**/*.scss']
paths = coffee: ['./src/scripts/**/*.coffee']

# Clean www directory first
gulp.task 'cleen', (done) ->
  gulp.src('./www/*', {read: false})
  .pipe(clean())
  .on('end', done)
  return

# compile sass / scss files
gulp.task 'sass', (done) ->
  gulp.src('./src/scss/ionic.app.scss')
  .pipe(sass())
  .pipe(gulp.dest('./www/css'))
  .pipe(minifyCss({
    keepSpecialComments: 0
  }))
  .pipe(rename({
    extname: '.min.css'
  }))
  .pipe(gulp.dest('./www/css/'))
  .on('end', done)
  return

# Compile coffee script files
gulp.task 'coffee', (done) ->
  gulp.src('./src/scripts/**/*.coffee')
  .pipe(coffee({
    bare: true,
    expand: true
  }).on('error', (e) ->
    gutil.log(e)
    gutil.beep()
  ))
  .pipe(gulp.dest('./www/scripts/'))
  .on('end', done)
  return

# Copy files
gulp.task 'copy-files', (done) ->
  gulp.src([
    './src/**/*.html'
    './src/config.xml'
    './src/images/**/*.png'
    './src/images/**/*.jpg'
    './src/js/**/*.js'
    './src/lib/**/*'
    './src/res/**/*.png'
    './src/res/**/*.jpg'
    './src/res/**/*.xml'
  ], {base: './src'})
  .pipe(gulp.dest('./www'))
  .on('end', done)
  return

# coffee lint
gulp.task('coffee-lint', ->
  gulp.src('./src/scripts/**/*.coffee')
  .pipe(coffeelint())
  .pipe(coffeelint.reporter())
  .pipe(coffeelint.reporter('fail'))
)

# Minify html
gulp.task 'minify-html', ->
  opts = {
    empty: true
    cdata: true
    comments: false
    spare: true
    quotes: true
  }
  gulp.src('./src/**/*.html')
  .pipe(minifyHTML(opts))
  .pipe(gulp.dest('./www/'))

# Browser Sync
gulp.task 'browser-sync', ['compile'], ->
  browserSync.init(["css/*.css", "scripts/*.js"], {
    server:
      baseDir: './www/'
  })

gulp.task 'html', ->
  gulp.src('./www/*.html')
  .pipe(connect.reload())

gulp.task 'connect', ['compile'], ->
  connect.server {
    root: ['www'],
    port: 9000,
    livereload: true
  }

# Watch for changes
gulp.task 'watch', ->
  server = livereload()
  gulp.watch paths.coffee, ['coffee']
  gulp.watch paths.sass, ['sass']
  gulp.watch paths.src, ['copy_files']
  gulp.watch ['./src/**/*.html'], ['minify-html']
  gulp.watch ['./www/**/*.html'], ['html']

# Combined tasks
gulp.task 'compile', ['sass', 'coffee', 'copy-files']

gulp.task 'default', ['compile', 'connect', 'watch']
