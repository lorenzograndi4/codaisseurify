function createSong(name, year) {

  var songBlock = $("<div class='song-block'></div>");

  var titleBlock = $("<h3 class='song-title'></h3>");
  titleBlock.html(name);

  var deleteLink = $("<a href='#' class='delete-song'></a>");
  deleteLink.html("[New delete link]");

  var detailBlock = $("<p></p>");
  detailBlock.html("Year: " + year + " ");

  songBlock.append(titleBlock);
  detailBlock.append(deleteLink);
  songBlock.append(detailBlock);

  $("#songslist").append(songBlock);
}

function submitSong(event) {
  event.preventDefault();
  var name = $("#new-song-name").val();
  var year = $("#new-song-year").val();
  createSong(name, year);
  $("#new-song-name").val(null);
  $("#new-song-year").val(null);
}

function removeSong(event) {
  event.preventDefault();
  $(this).parent().parent().remove()
}

function removeAllSongs(event) {
  event.preventDefault();
  $.when($(".song-block").remove())
}

$(document).ready(function() {
  $("form").bind('submit', submitSong);
  $(".delete-song").bind('click', removeSong);
  $("#delete-all").bind('click', removeAllSongs);
});
