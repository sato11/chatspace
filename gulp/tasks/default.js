/*eslint-env node*/

const gulp        = require( 'gulp' );
const runSequence = require( 'run-sequence' );

gulp.task( 'default', () => {
    runSequence(
        'clean',
        'fonts',
        'compile-scss',
        'webpack',
        'bower'
    );
});
