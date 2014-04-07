$( document ).ready(function() {
  $.getJSON('/membres.json', function(data) {
    var template = $('#container_div').html();
    var html = Mustache.to_html(template, data);
    $('#sampleArea').html(html);
  });
});
