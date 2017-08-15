/*eslint-env node*/

const gulp        = require( 'gulp' );
const runSequence = require( 'run-sequence' );

gulp.task( 'default', () => {
    runSequence(
        'clean',
        'compile-scss',
        'webpack'
    );
});
