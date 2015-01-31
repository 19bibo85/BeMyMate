var sectionId = 2;
var languageCode = 'en-us';
var uriMenu = 'api/menus?sectionId=' + sectionId + '&languageCode=' + languageCode;

$(document).ready(function () {
    $.ajax({
        type: "GET",
        url: uriMenu,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data) {
            $.each(data, function (key, item) {
                $('<li>', { text: item.Name }).appendTo($('#menus'));
                $.each(item.Items, function (key, item) {
                    if (item.Id != null) {
                        $("<ul>")
                        .append($('<a>',
                                {
                                    text: item.Name,
                                    title: item.Name,
                                    href: item.Link
                                })).appendTo($('#menus'));
                    }
                })
            })
        },
        error: function () {
            alert("An error occurred. Please contact the administrator.");
        }
    })
})

function buildMenuItemList(item) {
    var hlink = $("<ul>")
                .append($('<a>',
                        {
                            text: item.Name,
                            title: item.Name,
                            href: item.Link
                        })).appendTo($('#menus'));
    return hlink;
}