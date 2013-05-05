var GALLERY = {
  container: "#gallery",
  url: "/images",
  delay: 5000,
  load: function(){
    var _gallery = this;
    $.ajax({
      type: "get",
      url: this.url,
      success: function(data) {
        var images = data;
        $.each(images, function() {
          _gallery.display(this);
        });
      }
    });
  },
  display: function(image_url) {
    $('<img></img>')
    .attr('src', image_url)
    .hide()
    .load(function() {
      $(this).fadeIn();
    })
    .appendTo(this.container);
  }
};

$(document).ready(function() {
  GALLERY.load();

  $("#album-button").on("click", function(){
    alert("hello");
    preventDefault();
    $.post("/album/create", function(data){
      $(".gallery").html(data)
    })
  });
});