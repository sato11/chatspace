/*eslint-env node*/

const config    = require( './config' );
const gulp      = require( 'gulp' );
const sass      = require( 'gulp-sass' );
const sassGlob  = require( 'gulp-sass-glob' );
const rename    = require( 'gulp-rename' );
const rev       = require( 'gulp-rev' );
const minifyCss = require( 'gulp-minify-css' );
const notify    = require( 'gulp-notify' );

gulp.task( 'compile-scss', () => {
    gulp.src( config.stylesheet.srcScss )
        .pipe( sassGlob())
        .pipe( sass())
        .pipe( minifyCss())
        .pipe( rename({ suffix: '.bundle' }))
        .pipe( rev())
        .pipe( gulp.dest( config.stylesheet.dest ))
        .pipe( rev.manifest( config.rev.dest, config.rev.opts ))
        .pipe( gulp.dest( config.publicAssets ))
        .pipe( notify( 'finish compile-scss' ));
});
