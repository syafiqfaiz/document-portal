$(function(){
  $('.search').submit(function(event){
    event.preventDefault()
    var query = $(this).find('input').val()
    var url = "/documents?query=" + query + "&&search=true"

    $.get(url, function(data, status){
      $('.search_result').append(data)
      $('.result').slideToggle("fast");
    })
  })
})