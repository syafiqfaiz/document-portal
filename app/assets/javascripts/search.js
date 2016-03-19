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

  $('.search').submit(function(event){
    event.preventDefault()
    var query = $(this).find('input').val()
    var url = "/documents?query=" + query + "&&search=true"

    $.get(url, function(data, status){
      $('.search_result').html(data)
      $('.result').slideToggle("fast");
      scrollToElement($('.result'))
    })
  })

  $(document.body).on('click', '#closeSearch', function(e){
    e.preventDefault()
    $('.search_result').html('')
    scrollToElement($('#top'))
    $('.result').slideToggle('fast')
  })
})