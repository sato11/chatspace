/*eslint-env node*/

const config        = require( './config' );
const gulp          = require( 'gulp' );
const webpack       = require( 'gulp-webpack' );
const webpackConfig = require( './webpack.config.js' );
const rev           = require( 'gulp-rev' );

gulp.task( 'webpack', () => {
    gulp.src( config.javascript.src )
        .pipe( webpack( webpackConfig ))
        .pipe( rev())
        .pipe( gulp.dest( webpackConfig.output.publicPath ))
        .pipe( rev.manifest( config.rev.dest, config.rev.opts ))
        .pipe( gulp.dest( config.publicAssets ));
});
