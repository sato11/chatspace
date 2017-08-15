$( function() {
    var $flash = $( '.flash-message' );

    if ( $flash ) {
        setTimeout( function() {
            $flash.fadeOut( 500 );
        }, 3000 );
    }
});
