// Adds an (auto) link next to the slug field to auto-fill it based on the
// post's title
$(function(){
  $('<a href="#">(auto)</a>').insertAfter("input#post_slug").click(function(event) {
    $("input#post_slug").attr(
      "value",
      $("input#post_title").attr("value").toLowerCase().split(/\ +/).join("-").replace(RegExp("[^abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-]"), "").replace(/\-+/, "-")
    );
    return false;
  });
});
