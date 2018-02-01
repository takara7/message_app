$(document).ready ->
    $(document).on "ajax:success", "#talk-post-form", (event) ->
        $(this).children("textarea").val("")
