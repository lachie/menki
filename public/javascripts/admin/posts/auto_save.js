// Auto-saves the post every 5 seconds
$(function(){
  var autoSave = function() {
    ($("#post").attr("action") == "/admin/posts") ? post() : put();

    // Flash "Draft Saved"
    var savedMessage = $('<p class="autosaved-notice"><strong>Draft Saved</strong></p>');
    savedMessage.appendTo("#post");
    savedMessage.fadeOut(2000, function () {
      $(this).remove();
    });

    poll();
  }
  
  var post = function() {
    $.post(
      $("#post").attr("action"),
      $("#post").serialize(),
      function(data) {
        // Change the form to a PUT on the post
        $("#post").attr("action", "/admin/posts/" + data.id);
        $("#post").append($('<input name="_method" type="hidden" value="put" />'));
      },
      "json"
    )
  }
  
  var put = function() {
    $.post(
      $("#post").attr("action"),
      $("#post").serialize(),
      function(data) {
        // Don't need to do anything
      },
      "json"
    )
  }
  
  var poll = function () {
    setTimeout(autoSave, 5000);
  }

  poll();
});
