$(document).ready ->
    $(document).on "ajax:success", ".user-summary form", (event) ->
        partial = event.detail[0]["partial"]
        $(this).replaceWith(partial)

    $(document).on "ajax:beforeSend", ".user-summary form", (event) ->
        $(this).children("button").prop("disabled", true)

    $(document).on "ajax:error", ".user-summary form", (event) ->
        $(this).children("button").prop("disabled", false)
        alert("失敗しました")

    $(document).on {
        "mouseenter": ->
            $(this).addClass("btn-danger").removeClass("btn-primary")
        "mouseleave": ->
            $(this).addClass("btn-primary").removeClass("btn-danger")
    }, "form.remove-friend button"
