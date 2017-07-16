function createSong(name, year) {
  var newSong = { name: name, year: year };
  var artistId = $('#submit-new-song').parent().attr('id');

  $.ajax({
    type: "POST",
    url: "/api/artists/" + artistId + "/songs.json",
    data: JSON.stringify({
        song: newSong
    }),
    contentType: "application/json",
    dataType: "json"
  })
  .done(function(data) {
    console.log(data);
    var songId = data.id
    var songBlock = $('<div class="song-block"></div>')
      .attr('id', songId);

    var titleBlock = $('<h3 class="song-title"></h3>')
      .text(name);

    var deleteLink = $('<a href="#" class="delete-song"></a>')
      .attr('song-id', songId)
      .text('[New delete link]');

    var detailBlock = $('<p></p>');
    detailBlock.text('Year: ' + year + ' ');

    songBlock.append(titleBlock);
    detailBlock.append(deleteLink);
    songBlock.append(detailBlock);

    $('#songs-list').append(songBlock);
  })
  .fail(function(error) {
    var errorHelpBlock = $('<span class="help-block" id="error-message" style="color: red;"></span>')
      .text('Both fields are required')
    console.log(error);
    $('#new-song-form')
      .prepend(errorHelpBlock);
  });
}

function resetErrors() {
    $("#error-message").remove();
}

function submitSong(event) {
  event.preventDefault();
  resetErrors();
  var name = $("#new-song-name").val();
  var year = $("#new-song-year").val();
  createSong(name, year);
  $("#new-song-name").val(null);
  $("#new-song-year").val(null);
}

function removeSong(event) {
  event.preventDefault();
  resetErrors();
  var artistId = $('#submit-new-song').parent().attr('id');
  var songId = $(this).attr('song-id');

  $.ajax({
    type: "DELETE",
    url: artistId + '/api/songs/' + songId + '.json',
    contentType: "application/json",
    dataType: "json"
  })
  .done(function(data) {
    var removeMsg = $('<p class="help-block" id="error-message" style="color: green;"></p>')
      .text('Song removed!');
    // var songId = data.id;
    console.log(data);
    $('#songs-list').prepend(removeMsg);
    $('div[id="'+songId+'"]').remove();
  });
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
