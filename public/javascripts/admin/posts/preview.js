// Previews the post every second via /admin/posts/preview
$(function(){
  $('<div id="preview">\
      <h2>Preview</h2>\
      <div class="html"></div>\
      <div class="source"><pre></pre></div>\
     </div>'
  ).insertAfter("form#post");
  
  var preview = function() {
    $.post(
      "/admin/posts/preview",
      {
        body: $("#post_body").attr("value") || "",
        format: $("#post_format option:selected").attr("value")
      },
      function(data) {
        $("#preview .html").html(data);
        $("#preview .source pre").text(data);
      }
    );
    poll();
  }

  var poll = function () {
    setTimeout(preview, 1000);
  }
  
  poll();
});
