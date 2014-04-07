$( document ).ready(function() {
  $.getJSON('/index.json', function(data) {
    var template = $('#div_of_the_template').html();
    var html = Mustache.to_html(template, data);
    $('#sampleArea').html(html);
  });
});