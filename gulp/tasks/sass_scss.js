/*eslint-env node*/

const config = require( './config' );
const gulp   = require( 'gulp' );
const sass   = require( 'sass' );

gulp.task( 'compile-sass', () => {
    gulp.src( config.stylesheet.srcSass )
        .pipe( sass())
        .pipe( gulp.dest( config.stylesheet.dest ));
});

gulp.task( 'compile-scss', () => {
    gulp.src( config.stylesheet.srcScss )
        .pipe( sass())
        .pipe( gulp.dest( config.stylesheet.dest ));
});
