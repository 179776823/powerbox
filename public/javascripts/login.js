$('#btn').on('click', function(){
  var username = $('#username').val();
  var password = $('#password').val();
  var obj = {
    username: username,
    password: password
  };
  $.ajax({
    type: 'POST',
    url: '/user/login',
    data: obj,
    success: function(data){
      console.log(data)
      if(data.status){
        window.location.href = '/';
      }else{
        alert('登录失败');
      }
    },
    error: function(){
      alert('登录失败');
    },
    dataType: 'json'
  });
});