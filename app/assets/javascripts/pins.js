// open dropdown and make inner elements clickable
$(document).ready(function() {
  $('#flag').click(function(e) {
    $('.dropdown-menu').dropdown('toggle');
  });
  $('.flag_link').click(function(e) {
  	e.stopPropagation();
  	$('.dropdown-menu').dropdown('toggle');
  });
});