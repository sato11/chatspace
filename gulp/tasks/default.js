/*eslint-env node*/

const gulp        = require( 'gulp' );
const runSequence = require( 'run-sequence' );

gulp.task( 'default', () => {
    runSequence(
        'clean',
        'installBower',
        ['concatBower', 'compile-scss', 'fonts'],
        'webpack'
    );
});
