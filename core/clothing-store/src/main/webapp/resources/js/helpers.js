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

Handlebars.registerHelper("paginationList", function (totalPages, currentPage) {
    var result = '<div class="pagination pagination-small"><ul class="nav">';
    if (currentPage > 1) {
        result += '<li><a href="/clothing/page/' + (currentPage - 1) + '">Назад</a></li>';
    } else {
        result += '<li class="disabled">Назад</li>';
    }
    for (var i = 1; i <= totalPages; i++) {
        if (i != currentPage) {
            result += '<li><a href="/clothing/page/' + i + '">' + i + '</a></li>';
        } else {
            result += '<li class="active"><a href="/clothing/page/' + i + '">' + i + '</a></li>';
        }
    }
    if (currentPage != totalPages) {
        result += '<li><a href="/clothing/page/' + (currentPage + 1) + '">Вперед</a></li>';
    } else {
        result += '<li class="disabled">Вперед</li>';
    }
    result += '</ul></div>';
    return new Handlebars.SafeString(result);
});