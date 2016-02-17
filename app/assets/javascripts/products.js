$(document).on('ready page:load', function() {

  $('search-form').submit( function(event) {
    event.preventDefault();

    var searchValue = $('#search').val();

    $.get('/products?search=' + searchValue)
      .success(function (data) {
        $('#products').html(data);
      });

  });

})
