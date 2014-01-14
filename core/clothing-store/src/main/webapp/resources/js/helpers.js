Handlebars.registerHelper("math", function (lvalue, operator, rvalue, options) {
    if (arguments.length < 4) {
        // Operator omitted, assuming "+"
        options = rvalue;
        rvalue = operator;
        operator = "+";
    }

    lvalue = parseFloat(lvalue);
    rvalue = parseFloat(rvalue);

    return {
        "+": lvalue + rvalue,
        "-": lvalue - rvalue,
        "*": lvalue * rvalue,
        "/": lvalue / rvalue,
        "%": lvalue % rvalue
    }[operator];
});

Handlebars.registerHelper("select-size-checkbox", function () {
    var result = '';
    for (var i = 36; i <= 72; i += 2) {
        result += '<label class="checkbox check-item-mini">' +
            '<input class="size_ch" type="checkbox" value="' + i + '" name="size[]">' + i +
            '</label>';
    }
    result += '<div class="clearfix"></div>';
    return new Handlebars.SafeString(result);
});

Handlebars.registerHelper("lengthArray", function (array) {
    return array.length;
});

Handlebars.registerHelper("valuesString", function (values) {
    var result = '';
    for (var i = 0; i < values.length; i++) {
        if (i == (values.length - 1)) {
            result += values[i] + ';';
        } else {
            result += values[i] + ', ';
        }
    }
    return result;
});

Handlebars.registerHelper("menuList", function (link, data) {
    var result = '';
    $.each(data, function () {
        result += '<li><a href="' + link + this.id + '">' + this.title + '</a></li>'
    });
    return new Handlebars.SafeString(result);
});

Handlebars.registerHelper("promo-product", function (product) {
    var result = '';
    var count = 0;
    $.each(product, function (i) {
        if (count == 0) {
            result += '<div class="item"><ul class="thumbnails listing-products">';
        }
        result += '<li class="span3"><div class="product-box"><span class="sale_tag"></span>' +
            '<a href="/clothing-store-0.1/clothing/' + this.id + '">' +
            '<img src="/resources/img/assets_images_FANTAZIA_57_1.jpg" alt="images"></a><br>' +
            '<a class="title" href="/clothing-store-0.1/clothing/' + this.id + '">' + this.title + '</a><span> , ' + this.brand.title + '</span><br>' +
            '<a class="category" href="#">' + this.category.title + '</a>' +
            '<p class="price">' + this.price + ' руб.</p>' +
            '</div></li>';
        count++;
        if (count == 4 || i == product.length - 1) {
            result += '</ul></div>';
            count = 0;
        }
    });

    return new Handlebars.SafeString(result);
});