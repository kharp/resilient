$(document).ready(function() {
  
  $('.registrationSubmit').hide(); 

  $('#eulalink').click(function() {
    $('#eulaModal').modal('toggle');
  });

  $('#checky').click(function(){
        if($(this).attr('checked') == true){
             $('.registrationSubmit').toggle();   
        } else {
            $('.registrationSubmit').toggle();
        }
    });
});