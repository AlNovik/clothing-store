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