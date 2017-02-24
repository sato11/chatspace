$( function() {
  // 変数の定義
  var $messageForm = $( '#new_message' );
  var $fileInput = $( '#file-input' );
  var $textField = $( '#message_body' );
  var imageChecker = $( 'input[type=file]' )[0].files.length;

  scrollToBottom();

  // チャット画面の最下部まで移動する関数
  function scrollToBottom() {
    var $messageBoard = $( '.message-board__content' );
    setTimeout( function(){
      $messageBoard.animate({
        scrollTop: $messageBoard.prop( 'scrollHeight' )
      }, 1000 );
    }, 100 );
  }

  // チャット画面において30秒おきに画面を更新する
  if ( $( 'body' ).attr( 'controller' ) == 'messages' ) {
    setInterval( function() {
      window.location.reload();
    }, 30000 );
  }

  // メッセージ毎にhtmlを構築する作業を関数として定義
  // 部分テンプレート_messageの構造に沿う
  function buildHTML( message ) {
    var user = $( '.sidebar__top-left' ).html();
    // 画像が存在しないときは空にすることでエラーを避ける
    if ( imageChecker === 0 ) { message.image = ''; }
    var $html = $( `
      <li class="message">
        <div class="message__user">
          <span class="message__user-name">${user}</span>
          <span class="message__posted-time">${message.time}</span>
        <div class="message__content">${message.body}
          <div class="message__image">
            <img src="${message.image}">
          </div>
        </div>
      </li>
    ` );
    return $html;
  }

  // formDataの形式を整える
  function buildFormData( f ) {
    var fd = new FormData( f.get( 0 ));
    var message = $( '.footer__message' ).val();
    var file = $( 'input[type=file]' )[0].files[0];
    fd.append( 'body', message );
    fd.append( 'image', file );

    return fd;
  }

  // 引数で渡されたフォームの選択を解除する
  function resetInput( e ) {
    e.wrap( '<form>' ).closest( 'form' ).get( 0 ).reset();
    e.unwrap();
  }

  // 画像は選択されると自動的に送信される
  $fileInput.on( 'change', function() {
    imageChecker = 1; // 一時的に変数を書き換えてバリデーションを通す
    $messageForm.trigger( 'submit' );
    resetInput( $( this ));
  });

  // submit時にjsonで非同期通信を行う
  $messageForm.on( 'submit', function( e ) {
    e.preventDefault();
    // テキストと画像の両方が空の際は処理に進まないバリデーション
    if ( !$textField.val() && imageChecker === 0 ) {
      alert( 'either text or image is required' );
    } else {
      var formData = buildFormData( $( this ));
      $.ajax({
        type: 'POST',
        url: './messages.json',
        data: formData,
        processData: false,
        contentType: false
      })
      .done( function( data ) {
        $( '.messages' ).append( buildHTML( data ));
        resetInput( $( '#message_body' ));
        imageChecker = $( 'input[type=file]' )[0].files.length; // 変数を初期化する
        scrollToBottom();
      })
      .fail( function() {
        alert( 'error communicating' );
      });
      return false;
    }
  });
});
