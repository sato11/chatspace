/*eslint-env node*/

const config = require( './config' );

module.exports = {
    entry: {
        application: './' + config.gulpAssets + '/javascripts/application'
    },
    output: {
        filename: '[name].bundle.js',
        publicPath: config.javascript.dest
    },
    resolve: {
        extensions: ['', '.js', 'jsx']
    }
};
