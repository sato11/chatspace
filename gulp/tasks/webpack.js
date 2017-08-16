/*eslint-env node*/

const config        = require( './config' );
const gulp          = require( 'gulp' );
const webpack       = require( 'gulp-webpack' );
const webpackConfig = require( './webpack.config.js' );
const rev           = require( 'gulp-rev' );
const uglify        = require( 'gulp-uglify' );
const notify        = require( 'gulp-notify' );
const gulpIf        = require( 'gulp-if' );

gulp.task( 'webpack', () => {
    gulp.src( config.javascript.src )
        .pipe( webpack( webpackConfig ))
        .pipe( gulpIf( config.isProduction, uglify()))
        .pipe( gulpIf( config.isProduction, rev()))
        .pipe( gulp.dest( webpackConfig.output.publicPath ))
        .pipe( gulpIf( config.isProduction, rev.manifest( config.rev.dest, config.rev.opts )))
        .pipe( gulpIf( config.isProduction, gulp.dest( config.publicAssets )))
        .pipe( gulpIf( !config.isProduction, notify( 'finish webpack' )));
});
