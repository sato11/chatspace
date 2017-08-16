/*eslint-env node*/

const config = require( './config' );
const gulp   = require( 'gulp' );
const filter = require( 'gulp-filter' );

gulp.task( 'fonts', function() {
    gulp.src( config.fonts.src )
        .pipe( filter( '**/*.{eot,svg,ttf,woff,woff2,otf}' ))
        .pipe( gulp.dest( config.fonts.dest ));
});
