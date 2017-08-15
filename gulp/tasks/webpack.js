/*eslint-env node*/

const config        = require( './config' );
const gulp          = require( 'gulp' );
const webpack       = require( 'gulp-webpack' );
const webpackConfig = require( './webpack.config.js' );

gulp.task( 'webpack', () => {
    gulp.src( config.javascript.src )
        .pipe( webpack( webpackConfig ))
        .pipe( gulp.dest( webpackConfig.output.publicPath ));
});
