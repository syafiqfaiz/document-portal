$(function(){
  //scroll to element
  function scrollToElement(target) {
    if( target.length ) {
      event.preventDefault();
      $('html, body').animate({
          scrollTop: target.offset().top
      }, 1000);
    }
  }

  $('#gotoPrice').click(function(e){
    e.preventDefault()
    scrollToElement($('#price'))
  })
})