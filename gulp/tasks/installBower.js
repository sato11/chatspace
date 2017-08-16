/*eslint-env node*/

const gulp    = require( 'gulp' );
const install = require( 'gulp-install' );

gulp.task( 'installBower', () => {
    return gulp.src( 'bower.json' )
        .pipe( install());
});
