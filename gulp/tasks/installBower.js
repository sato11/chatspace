/*eslint-env node*/

const gulp    = require( 'gulp' );
const install = require( 'gulp-install' );

gulp.task( 'installBower', () => {
    gulp.src( 'bower.json' )
        .pipe( install());
});
