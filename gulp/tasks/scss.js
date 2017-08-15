/*eslint-env node*/

const config = require( './config' );
const gulp   = require( 'gulp' );
const sass   = require( 'gulp-sass' );

gulp.task( 'compile-scss', () => {
    gulp.src( config.stylesheet.srcScss )
        .pipe( sass())
        .pipe( gulp.dest( config.stylesheet.dest ));
});
