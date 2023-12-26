(function ($) {
  $(function () {
    $(".sidenav").sidenav();
    $(".tabs").tabs();
    $(".materialboxed").materialbox();
    $("select").formSelect();
    $(".slider").slider();
    $(".tooltipped").tooltip();
    $(".modal").modal();
    $(".collapsible").collapsible();

    $(".vote").click(function () {
      var a_tag = $(this);
      var csrf = $("input[name='csrfmiddlewaretoken']").val();
      var url = $("input[name='url_path']").val();
      var answer_id = $(this).attr("answer-id");
      var vote_type = $(this).attr("vote-type");

      $.ajax({
        url: url_path + "/vote",
        type: "POST",
        data: {
          csrfmiddlewaretoken: csrf,
          answer_id: answer_id,
          vote_type: vote_type,
        },
        caches: false,
        success: function (data) {
          $(".vote").removeClass("green-text");
          $(".vote").removeClass("red-text");
          if (vote_type == "U") {
            $(a_tag).addClass("green-text");
          } else {
            $(a_tag).addClass("red-text");
          }
          $("#answerVotes" + answer_id).text(data);
        },
      });
      return false;
    });
  }); // end of document ready
})(jQuery); // end of jQuery name space
