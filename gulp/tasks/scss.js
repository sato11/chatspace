/*eslint-env node*/

const config   = require( './config' );
const gulp     = require( 'gulp' );
const sass     = require( 'gulp-sass' );
const sassGlob = require( 'gulp-sass-glob' );

gulp.task( 'compile-scss', () => {
    gulp.src( config.stylesheet.srcScss )
        .pipe( sassGlob())
        .pipe( sass())
        .pipe( gulp.dest( config.stylesheet.dest ));
});
