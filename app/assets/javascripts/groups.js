$(function() {
  var textField = $('#user-search-field input');

  // 検索結果のユーザーを表示するためのHTMLを作成する
  function addUserHTML(user) {
    var html = $(`
      <li class="result-list">
        <span class="result-list--left">${user.name}</span>
        <span class="result-list--right">追加</span>
        <input value="${user.id}" type="hidden">
      </li>
      `);
    $('#result-field').append(html);
  }

  // jsonで受け取ったUsers.allの配列を入力された値と照合し、一致するユーザーを判定する
  function getUser(users, input) {
    $.each(users, function(i, user) {
      var name = user.name;
      var reg = RegExp("^" + input);
      if (input.length !== 0 && name.match(reg)) {
        addUserHTML(user);
      }
    });
  }

  // ユーザー検索時にjsonと通信する
  $( textField ).on('keyup', function(e) {
    e.preventDefault();
    var input = $( textField ).val();
    $.ajax('/groups/new.json')
      .done(function(data) {
        $('#result-field li').remove();
        getUser(data, input);
      })
      .fail(function() {
        alert('error');
      })
  });

  // ユーザー追加時にチャットメンバーに表示するためのHTMLを作成する
  function addedUserHTML(name, id) {
    var $html = $(`
      <li class="chat-group-user">
        <div class="chat-group-user__name">${name}</div>
        <div class="chat-group-user__btn chat-group-user__btn--remove">削除</div>
        <input value="${id}" type="hidden">
      </li>
      `);
    return $html;
  }

  // 追加ボタンがクリックされた時に該当するユーザーの名前とidを取得してチャットメンバーに表示する
  $(document).on('click', '.result-list--right', function() {
    var name = $(this).prev().html();
    var id = $(this).next().attr('value');
    var html = addedUserHTML(name, id);
    $('#added-users').append(html);
    $('#user-search-field .chat-group-form__input').val('');
    // collection_check_boxesの該当ユーザーにチェックを入れる
    $('input[value=' + id + ']').prop("checked", true);
    // 検索結果を初期化する
    $('.result-list').remove();
  });

  // 削除ボタンがクリックされた時に該当するユーザーをチャットメンバーから削除する
  $(document).on('click', '.chat-group-user__btn--remove', function() {
    $(this).parent().remove();
    // collection_check_boxesの該当ユーザーからチェックを外す
    var id = $(this).next().attr('value');
    $('input[value=' + id + ']').prop("checked", false);
  });
});
