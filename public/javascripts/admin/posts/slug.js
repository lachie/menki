$(function(){
  $('<a href="#">(auto)</a>').click(function(event) {
    event.stopPropagation();
    $("input#post_slug").attr(
      "value",
      $("input#post_title").attr("value").toLowerCase().split(/\ +/).join("-").replace(/\-+/, "-").replace(RegExp("[^abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-]"), "")
    );
  }).insertAfter("input#post_slug");
});
