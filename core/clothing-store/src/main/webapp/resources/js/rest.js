$.post = function (url, data, success, dataType) {
    return $.ajax({
        url: url,
        type: "POST",
        data: data,
        success: success,
        dataType: dataType
    });
};

$.postJSON = function (url, data, callback) {
    return jQuery.ajax({
        'type': 'POST',
        'url': url,
        'contentType': 'application/json; charset=utf-8',
        'mimeType': 'application/json',
        'data': $.toJSON(data),
        'dataType': 'json',
        'success': callback
    });
};

$.putJSON = function (url, data) {
    return jQuery.ajax({
        'type': 'PUT',
        'url': url,
        'contentType': 'application/json; charset=utf-8',
        'mimeType': 'application/json',
        'data': $.toJSON(data),
        'dataType': 'json'
    });
};

$.deleteItem = function(url){
    return $.ajax({
        'type': 'DELETE',
        'url': url
    });
};

App.Rest.categories = $.getJSON(App.Rest.link + '/category');
App.Rest.brands = $.getJSON(App.Rest.link + '/brand');
App.Rest.clothing = $.getJSON(App.Rest.link + '/clothing');
App.Rest.orders = $.getJSON(App.Rest.link + '/order');
