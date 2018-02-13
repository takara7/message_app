$(document).ready ->
    $(document).on "ajax:success", "#talk-post-form", (event) ->
        $(this).children("textarea").val("")

    $(document).on "ajax:success", ".delete-link", (event) ->
        $(this).closest(".talk").remove()
