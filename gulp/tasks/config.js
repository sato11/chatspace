/*eslint-env node*/

const gulpAssets   = 'gulp/assets';
const publicAssets = 'public/assets';

module.exports = {
    gulpAssets:   gulpAssets,
    publicAssets: publicAssets,
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
    }
};
