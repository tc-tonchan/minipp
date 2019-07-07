$(function(){
  function buildHTML(tweet){
    var text = tweet.text ? `${ tweet.text }` : "";
    var html = `<div class="Chat">
                  <div class="Chat__user-name">
                    ${tweet.user.nickname}
                  </div>
                  <div class="Chat__content">
                    ${text}
                  </div>
                  <div class="Chat__edit"></div>
                  <a data-method="get" href="/tweets/2/edit">編集</a>
                  <div class="Chat__delete"></div>
                  <a rel="nofollow" data-method="delete" href="/tweets/2">削除</a>
                </div>`
  return html;

  }
  $('#tweet_text').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
      .don(function(tweet){
        var html = buildHTML(tweet);
        $('.Chats').append(html);
        $('#tweet_text')[0].reset();
        $('.Chats').animate({ scrollTop: $('.Chats')[0].scrollHeight});
        return false
      })
      .fail(function(){
        alert('error');
      })
      // .always(function(this){
      //   $('.form__submit').prop('disabled', false);
      // })
  })
});