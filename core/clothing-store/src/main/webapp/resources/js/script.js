function buildCatalog(itemCollection, contextPath) {
    var rowCount = 0;
    $.each(itemCollection.clothings, function () {
        if (rowCount == 0) {
            $('#items').append('<div class="row-fluid"></div>');
        }
        var item = '<div class="thumbnail span3">' +
            '<a href="' + contextPath + '/clothing/' + this.id + '">' +
            '<img class="test" src="' + contextPath + this.images[0].link + '" alt=""></a>' +
            '<h6>' + this.title + '</h6>' +
            '<span class="badge">' + this.price + ' руб.</span>' +
            '<dl class="dl-horizontal">' +
            '<dt>Фирма :</dt><dd>' + '<a href="' + contextPath + '/brand/' + this.brand.id + '">' + this.brand.title + '</a></dd>' +
            '<dt>Размер :</dt><dd>' + arrayToSting(this.size) + '</dd>' +
            '<dt>Тип :</dt><dd>' + this.category.title + '</dd>' +
            '</dl><p>' +
            '<input type="text" class="input-mini">' +
            '<a class="btn btn-mini btn-primary" href="#"><i class="icon-plus icon-white"></i> В корзину</a>' +
            '<a class="btn btn-mini" href="#">Подробнее</a>' +
            '</p></div>';
        if (rowCount < 4) {
            $('#items .row-fluid:last-child').append(item);
            rowCount++;
            if (rowCount == 4) rowCount = 0;
        }
    });
}

function arrayToSting(array) {
    var str = '';
    $.each(array, function (i) {
        str += (i == array.length - 1) ? this + '; ' : this + ', ';
    });
    return str;
}