var App = {
    link: appLink,
    Templates: {},
    Rest: {link: restAPI},
    Storage: {
        save: function (key, data) {
            $.cookie(key, JSON.stringify(data), { expires: 28, path: '/'});
        },
        get: function (key) {
            return JSON.parse($.cookie(key));
        },
        delete: function (key) {
            $.cookie(key, null, {path: '/'});
        }}
};

$(document).ready(function () {
    initData();
    searchModel();
});

$(window).unload(function () {
    console.info('cartToCookie');
    cartToCookie();
});

function shoppingCartEvent() {
    $('#shopping').click(function (e) {
        var clicked = $(e.target);

        switch (true) {
            case clicked.hasClass('delete'):
                var ind = clicked.closest("tr")[0].rowIndex;
                App.cart.items.splice(ind - 1, 1);

        }
        initShoppingCart();
        basketCount();
    })
}

function initData() {
    var category;
    var brand;
    $.getJSON(App.Rest.link + '/category').done(function (data) {
        category = data;
        $.getJSON(App.Rest.link + '/brand').done(function (data) {
            brand = data;
            searchBar(category, brand);
            buildMenu(category, brand);
        });
    });


    App.cart = {items: [],
        totalPrice: 0};
    if (App.Storage.get('basketCart') != null) {
        var basketItems = App.Storage.get('basketCart');
        if (basketItems.length > 0) {
            var titles = [];
            $.each(basketItems, function () {
                titles.push(this.title);
            });
            $.getJSON(App.Rest.link + '/search/clothing', {titles: titles},function (json) {
                $.each(json.products, function (i) {
                    var item = {};
                    item.price = this.price;
                    item.brand = this.brand.title;
                    item.category = this.category.title;
                    item.title = basketItems[i].title;
                    item.size = basketItems[i].size;
                    item.quantity = Number(basketItems[i].quantity);
                    item.sum = item.quantity * item.price;
                    App.cart.totalPrice += item.sum;
                    App.cart.items.push(item);
                });
                basketCount();
            }).complete(function () {
                    initShoppingCart();
                    editQuantity();
                });
        }
    } else {
        basketCount();
    }
}

function addCart() {
    if (App.cart == null) {
        App.cart = {items: [],
            totalPrice: 0};
    }
    if (App.cart.items.length > 0) {
        var inBasket = false;
        $.each(App.cart.items, function (i) {
            if (this.title == $('#product-title').text() && this.size == $('#add-cart-size').val()) {
                App.cart.items[i].quantity += Number($("input[name='quantity']").val());
                App.cart.totalPrice += App.cart.items[i].quantity * App.cart.items[i].price - App.cart.items[i].sum;
                inBasket = true;
            }
        });
        if (!inBasket) {
            addItemToCart();
        }
    } else {
        addItemToCart();
    }
    basketCount();
}

function cartToCookie() {
    if (App.cart.items.length > 0) {
        var items = [];
        $.each(App.cart.items, function () {
            var item = {};
            item.title = this.title;
            item.size = this.size;
            item.quantity = this.quantity;
            items.push(item);
        });
        App.Storage.save('basketCart', items)
    }
}

function addItemToCart() {
    $.getJSON(App.Rest.link + '/search', {title: $('#product-title').text()}, function (data) {
        var item = {};
        var res = data.clothing[0];
        item.price = res.price;
        item.brand = res.brand.title;
        item.category = res.category.title;
        item.title = $('#product-title').text();
        item.size = Number($('#add-cart-size').val());
        item.quantity = Number($("input[name='quantity']").val());
        item.sum = item.quantity * item.price;
        App.cart.totalPrice += item.sum;
        App.cart.items.push(item);
        basketCount();
    });
}

function initShoppingCart() {
    var render = App.Templates.shoppingTable(App.cart);
    $('#shopping').html(render);
    $("input[name='quantity']").spinedit();
    editQuantity();
    basketCount();
}

function editQuantity() {
    $("input[name='quantity']").blur(function (e) {
        var newQuantity = Number($(this).val());
        var tr = $(this).closest("tr");
        var title = tr.find('.item-title').html();
        var size = Number(tr.find('.item-size').html());
        var ind = tr[0].rowIndex - 1;
        App.cart.items[ind].quantity = newQuantity;
        App.cart.totalPrice = App.cart.totalPrice - App.cart.items[ind].sum + App.cart.items[ind].quantity * App.cart.items[ind].price;
        App.cart.items[ind].sum = App.cart.items[ind].quantity * App.cart.items[ind].price;
        initShoppingCart();
    });
    $('.spinedit i').click(function () {
        $(this).closest('td').find("input[name='quantity']").blur();
    })
}

function basketCount() {
    if (App.cart.items.length > 0) {
        var title = App.cart.items.length + ' ' + numeralEnding(App.cart.items.length, ['товар', 'товара', 'товаров']) + ' - ' + App.cart.totalPrice + ' руб.';
        $('#cart-total').html(title);
    }
    else {
        $('#cart-total').html('0 товаров - 0 руб.')
    }
}

$('#search-param').submit(function (e) {
    var formData = form2js('search-param', '.', true);
//        delete formData._wysihtml5_mode;
    $.postJSON(App.Rest.link + '/clothing', formData)
        .success(function () {
            $('#newProduct').trigger('reset');
            $('#modal-product-add').modal('hide');
            alert("Успешное выполнение");
        })
        .error(function () {
            alert("Ошибка выполнения");
        })
        .complete(function () {
            alert("Завершение выполнения");
        });
    e.preventDefault(); // prevent actual form submit and page reload
});

function totalPrice() {
    var total = 0;
    $.each(App.cart.items, function () {
        total += this.sum;
    });

    return total;
}

function buildMenu(category, brand) {
    var categoryMenu = '';
    var brandMenu = '';
    $.each(category.categories, function () {
        categoryMenu += '<li><a href="' + App.link + '/catalog/category/' + this.id + '">' + this.title + '</a></li>';
    });
    $('#category').append(categoryMenu);
    $.each(brand.brands, function () {
        brandMenu += '<li><a href="' + App.link + '/catalog/brand/' + this.id + '">' + this.title + '</a></li>';
    });
    $('#company').append(brandMenu);
}

function searchBar(category, brand) {
//    Блок выбора размеров
    App.Templates.searchSizeBlock = Handlebars.compile($("#search-size-checkbox-block").html());
    $('#search-size-checkbox').html(App.Templates.searchSizeBlock);
//        Блок выбора категорий
    App.Templates.searchCategoryBlock = Handlebars.compile($('#search-category-checkbox-block').html());
    $('#search-category-checkbox').html(App.Templates.searchCategoryBlock(category));
//        Блок выбора производителя
    App.Templates.searchBrandBlock = Handlebars.compile($('#search-brand-checkbox-block').html());
    $('#search-brand-checkbox').html(App.Templates.searchBrandBlock(brand));
}

function searchModel() {
    var form = $('#search-title').serialize();
    var options = {
        url: App.Rest.link + '/search'
    };
    $("#search-title").submit(function () {
        var param = $('#search-title').serialize();
        var url = App.Rest.link + '/search';
        $.get(url, param,
            function (items) {
                alert(items.clothing.length);
//                    window.location.replace(appLink + "/clothing/" + item.clothing[0].id);
            },
            'json'
        );
    });
    $('#title').typeahead({
        source: function (title, process) {
            return $.get(App.Rest.link + '/search/model', { title: title }, function (data) {
                return process(data.title);
            });
        },
        //вывод данных в выпадающем списке
        //действие, выполняемое при выборе елемента из списка
        updater: function (title) {
            $.get(App.Rest.link + '/search', {'title': title},
                function (item) {
                    window.location.replace(App.link + "/clothing/" + item.clothing[0].id);
                },
                'json'
            );
        }
        //действие, выполняемое при выборе елемента из списка
    });
}

function numeralEnding(number, array) {
    if (number > 10 && number < 15) {
        return array[2];
    }
    else {
        switch (number % 10) {
            case 1:
                return array[0];
            case 2:
            case 3:
            case 4:
                return array[1];
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 0:
                return array[2];
        }
    }
}