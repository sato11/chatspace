/*eslint-env node*/

const config = require( './config' );
const glob   = require( 'glob' );

module.exports = {
    entry: {
        application: glob.sync( `./${config.gulpAssets}/javascripts/**/*` )
    },
    output: {
        filename: '[name].bundle.js',
        publicPath: config.javascript.dest
    },
    resolve: {
        extensions: ['', '.js', 'jsx']
    }
};
