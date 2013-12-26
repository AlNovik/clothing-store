App.Rest.clothing = App.Rest.link + '/clothing';
App.Rest.clothingId = function (id) {
    return App.Rest.link + '/clothing/' + id;
};
App.Rest.clothingCategory = function (id) {
    return App.Rest.link + '/clothing/category/' + id;
};
App.Rest.clothingBrand = function (id) {
    return App.Rest.link + '/clothing/brand/' + id;
};
App.Rest.category = App.Rest.link + '/category';
App.Rest.categoryId = function (id) {
    return App.Rest.link + '/category/' + id;
};
App.Rest.brand = App.Rest.link + '/brand';
App.Rest.brandId = function (id) {
    return App.Rest.link + '/brand/' + id;
};

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
        'data': JSON.stringify(data),
        'dataType': 'json',
        'success': callback
    });
};

$.putJSON = function (url, data, callback) {
    return jQuery.ajax({
        'type': 'PUT',
        'url': url,
        'contentType': 'application/json; charset=utf-8',
        'mimeType': 'application/json',
        'data': JSON.stringify(data),
        'dataType': 'json',
        'success': callback
    });
};

$.deleteItem = function (url) {
    return $.ajax({
        'type': 'DELETE',
        'url': url
    });
};