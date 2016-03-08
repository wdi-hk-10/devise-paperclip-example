$(document).ready(function(){
  $.auth.configure({
    apiUrl: 'http://localhost:3000'
  });

  $('#signup-form').on('submit', function(e){
    e.preventDefault();

    $.auth.emailSignUp({
      email: $('#signup-form input[name="email"]').val(),
      password: $('#signup-form input[name="password"]').val(),
      password_confirmation: $('#signup-form input[name="password_confirmation"]').val()
    }).then(function(user){
      console.log(user);
    }).fail(function(resp){
      console.log(resp);
    });
  });

  $('#logout-button').on('click', function(e){
    e.preventDefault();

    $.auth.signOut().then(function(resp){
      console.log(resp);
    }).fail(function(resp){
      console.log(resp);
    });
  });

  $('#signin-form').on('submit', function(e){
    e.preventDefault();

    $.auth.emailSignIn({
      email: $('#signin-form input[name="email"]').val(),
      password: $('#signin-form input[name="password"]').val(),
    }).then(function(user){
      console.log(user);
    }).fail(function(resp){
      console.log(resp);
    });
  });

  $('#image-form').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData();
    var imageFile = $('#image-form input[name="image"]')[0].files[0];
    formData.append('user[image]', imageFile);

    $.ajax({
      method: 'POST',
      url: '/image',
      dataType:"JSON",
      cache: false,
      contentType: false,
      processData: false,
      data: formData,
      success: function(resp){
        console.log(resp);
      },
      error: function(resp){
        console.log(resp);
      }
    });
  });
});