/*eslint-env node*/

const config = require( './config' );
const gulp   = require( 'gulp' );
const browserSync = require( 'browser-sync' ).create();

gulp.task( 'watch', () => {
    browserSync.init({
        proxy: 'localhost:3000'
    });

    gulp.watch( config.watch.stylesheetScss, ['compile-scss'] );
    gulp.watch( config.watch.javascript, ['webpack'] );

    gulp.watch( config.watch.browserSync ).on( 'change', browserSync.reload );
});
