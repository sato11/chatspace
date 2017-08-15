/*eslint-env node*/

const config = require( './config' );
const glob   = require( 'glob' );

module.exports = {
    entry: {
        application: glob.sync( `./${config.gulpAssets}/javascripts/**/*` )
    },
    output: {
        filename: config.isProduction ? '[name].bundle.js' : '[name].js',
        publicPath: config.javascript.dest
    },
    resolve: {
        extensions: ['', '.js', 'jsx']
    },
    module: {
        loaders: [
            { test: /\.js?$/, loader: 'babel?presets[]=es2015' }
        ]
    }
};
