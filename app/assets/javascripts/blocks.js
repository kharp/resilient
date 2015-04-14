$(document).ready(function() {
  
  $('#blockFlag').click(function(e) {
    $('.dropdown-menu').dropdown('toggle');
  });
  $('.flag_link').click(function(e) {
  	e.stopPropagation();
  	$('.dropdown-menu').dropdown('toggle');
  });

  $("#blockUser").click(function(event) {
  	event.preventDefault();
  	if(confirm("Are you sure? Blocking this user will remove all their content from your feed.")) {
    	$("#blockForm").submit();
  	}
	});

});



  