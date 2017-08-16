/*eslint-env node*/

const bowerDir     = 'bower_components';
const fontsDir     = 'public/fonts';
const gulpAssets   = 'gulp/assets';
const publicAssets = 'public/assets';
const minimist     = require( 'minimist' );

const envOption = {
    string: 'env',
    default: { env: process.env.NODE_ENV || 'development' }
};
const options     = minimist( process.argv.slice( 2 ), envOption );

module.exports = {
    gulpAssets:   gulpAssets,
    publicAssets: publicAssets,
    fonts: {
        src:  bowerDir     + '/font-awesome/fonts/**.*',
        dest: fontsDir
    },
    javascript: {
        src:  gulpAssets   + '/javascripts/**/*',
        dest: publicAssets + '/javascripts'
    },
    stylesheet: {
        srcScss:  gulpAssets   + '/stylesheets/application.scss',
        dest:     publicAssets + '/stylesheets'
    },
    watch: {
        javascript:     gulpAssets + '/javascripts/**/*',
        stylesheetScss: gulpAssets + '/stylesheets/**/*.scss',
        browserSync:    'public/**/*'
    },
    browserSync: {
        proxy: 'localhost:3000'
    },
    rev: {
        dest: publicAssets + '/rev-manifest.json',
        opts: {
            base:  process.cwd() + '/' + publicAssets,
            merge: true
        }
    },
    isProduction: options.env === 'production' ? true : false
};
