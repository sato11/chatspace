/*eslint-env node*/

const config = require( './config' );
const gulp   = require( 'gulp' );
const bower  = require( 'main-bower-files' );
const concat = require( 'gulp-concat' );
const notify = require( 'gulp-notify' );
const filter = require( 'gulp-filter' );

gulp.task( 'concatBower', () => {
    gulp.src( bower())
        .pipe( filter( '**/*.js' ))
        .pipe( concat( 'bower.js' ))
        .pipe( gulp.dest( config.javascript.dest ))
        .pipe( notify( 'finish bower' ));
});
