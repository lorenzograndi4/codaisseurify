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
    var addMsg = $('<p class="help-block" id="error-message" style="color: green;"></p>')
      .text('New song added');
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

    $('#songs-list').prepend(songBlock);

    resetErrors();
    $('#songs-list').prepend(addMsg);
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
    console.log(data);
    $('#songs-list').prepend(removeMsg);
    $('div[id="'+songId+'"]').remove(); // UGLYYYYY
  });
}

// I'm not breaking my removeSong function to make this one work.
// So I'm repeating myself with a new ajax call -> refactoring needed

function removeAllSongs(event) {
  event.preventDefault();
  $.each($(".song-block"), function(index, block) {
    var songId = $(block).attr('id');
    var artistId = $('#submit-new-song').parent().attr('id');
    $.ajax({
      type: "DELETE",
      url: artistId + '/api/songs/' + songId + '.json',
      contentType: "application/json",
      dataType: "json"
    })
    .done(function(data) {
      console.log(data);
    })
    .done(function(data) {
      var removeAll = $('<p class="help-block" id="error-message" style="color: green;"></p>')
        .text('All songs removed OMG!');
      $.when($(".song-block").remove());
      resetErrors();
      $('#songs-list').prepend(removeAll); // Unnecessary to print this every time
    })
  });
}

$(document).ready(function() {
  $("form").bind('submit', submitSong);
  $(".delete-song").bind('click', removeSong);
  $("#delete-all").bind('click', removeAllSongs);
});
