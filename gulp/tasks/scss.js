/*eslint-env node*/

const config    = require( './config' );
const gulp      = require( 'gulp' );
const sass      = require( 'gulp-sass' );
const sassGlob  = require( 'gulp-sass-glob' );
const rename    = require( 'gulp-rename' );
const rev       = require( 'gulp-rev' );
const minifyCss = require( 'gulp-minify-css' );
const notify    = require( 'gulp-notify' );
const gulpIf    = require( 'gulp-if' );

gulp.task( 'compile-scss', () => {
    gulp.src( config.stylesheet.srcScss )
        .pipe( sassGlob())
        .pipe( sass())
        .pipe( gulpIf( config.isProduction, minifyCss()))
        .pipe( gulpIf( config.isProduction, rename({ suffix: '.bundle' })))
        .pipe( gulpIf( config.isProduction, rev()))
        .pipe( gulp.dest( config.stylesheet.dest ))
        .pipe( gulpIf( config.isProduction, rev.manifest( config.rev.dest, config.rev.opts )))
        .pipe( gulpIf( config.isProduction, gulp.dest( config.publicAssets )))
        .pipe( notify( 'finish compile-scss' ));
});
