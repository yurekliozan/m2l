$( document ).ready(function() {
  $.getJSON(window.location.pathname + '.json', function(data) {
    var template = $('#container_div').html();
    var html = Mustache.to_html(template, data);
    $('#sampleArea').html(html);
  });
});
