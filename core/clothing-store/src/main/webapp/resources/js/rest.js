function clothingPage(url) {
    var result;
    $.getJSON(url, function (json) {
        result = json;
    })
}