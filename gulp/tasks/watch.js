/*eslint-env node*/

const config = require( './config' );
const gulp   = require( 'gulp' );

gulp.task( 'watch', () => {
    gulp.watch( config.watch.stylesheetScss, ['compile-scss'] );
    gulp.watch( config.watch.javascript, ['webpack'] );
});
