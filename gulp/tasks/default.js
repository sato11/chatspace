/*eslint-env node*/

const gulp        = require( 'gulp' );
const runSequence = require( 'run-sequence' );

gulp.task( 'default', () => {
    runSequence(
        'clean',
        'fonts',
        'installBower',
        /*
          Tasks below are excuted after 'installBower' is completed.
          ['concatBower', 'compile-scss'],
        */
        'webpack'
    );
});
