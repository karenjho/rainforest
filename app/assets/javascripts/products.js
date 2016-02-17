$(document).on('ready page:load', function() {

  $('search-form').submit( function(event) {
    event.preventDefault();

    var searchValue = $('#search').val();

    $.ajax({
      type: 'GET',
      url: '/products?search=' + searchValue,
      dataType: 'HTML',
    }).success(function (data) {
      $('#products').html(data);
    });

  });

})
