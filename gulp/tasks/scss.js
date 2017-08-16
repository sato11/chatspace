/*eslint-env node*/

const config    = require( './config' );
const gulp      = require( 'gulp' );
const sass      = require( 'gulp-sass' );
const sassGlob  = require( 'gulp-sass-glob' );
const minifyCss = require( 'gulp-minify-css' );
const notify    = require( 'gulp-notify' );
const gulpIf    = require( 'gulp-if' );

gulp.task( 'compile-scss', ['installBower'], () => {
    gulp.src( config.stylesheet.srcScss )
        .pipe( sassGlob())
        .pipe( sass())
        .pipe( gulpIf( config.isProduction, minifyCss()))
        .pipe( gulp.dest( config.stylesheet.dest ))
        .pipe( gulpIf( !config.isProduction, notify( 'finish compile-scss' )));
});
