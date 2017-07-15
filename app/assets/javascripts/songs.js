function removeSong(event) {
  event.preventDefault();
  $(this).parent().parent().remove()
}

function removeAllSongs(event) {
  event.preventDefault();
  $.when($(".song-block").remove())
}

$(document).ready(function() {
  // $("form").bind('submit', submitSong);
  $(".delete-song").bind('click', removeSong);
  $("#remove-all").bind('click', removeAllSongs);
});
