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
    basketCount();
    initData();
    searchModel();
});

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
}

function addCart() {
    var basket;
    if (App.Storage.get('basketCart') == null) {
        basket = {items: []};
    } else {
        basket = App.Storage.get('basketCart');
    }
    if (basket.items.length > 0) {
        var inBasket = false;
        $.each(basket.items, function () {
            if (this.title == $('#product-title').text() && this.size == $('#add-cart-size').val()) {
                this.quantity += parseInt($("input[name='quantity']").val(), 10);
                inBasket = true;
            }
        });
        if (!inBasket) {
            basket.items.push(addItemToCart());
        }
    } else {
        basket.items.push(addItemToCart());
    }
    App.Storage.save('basketCart', basket);
    basketCount();
}

function addItemToCart() {
    var item = {};
    item.title = $('#product-title').text();
    item.size = parseInt($('#add-cart-size').val(), 10);
    item.quantity = parseInt($("input[name='quantity']").val(), 10);
    return item;
}

function initShoppingTable() {
    var data = {items: []};
    var basketItems = App.Storage.get('basketCart');
    var titles = [];
    $.each(basketItems.items, function () {
        titles.push(this.title);
    });
    $.getJSON(App.Rest.link + '/search/clothing', {titles: titles},function (json) {
        $.each(json.products, function (i) {
            var item = {};
            item.price = this.price;
            item.brand = this.brand.title;
            item.category = this.category.title;
            item.title = basketItems.items[i].title;
            item.size = basketItems.items[i].size;
            item.quantity = basketItems.items[i].quantity;
            data.items.push(item);
        });
    }).complete(function () {
            var render = template(data);
            $('#shopping').html(render);
            editQuantity();
            totalPrice();
            deleteItem();
        });
}

function editQuantity() {
    $("input[name='quantity']").spinedit().blur(function (e) {
        var newQuantity = $(this).val();
        var tr = $(this).closest("tr");
        var title = tr.find('.item-title').html();
        var size = tr.find('.item-size').html();
        var basket = App.Storage.get('basketCart');
        $.each(basket.items, function () {
            if (this.title == title && this.size == size) {
                this.quantity = newQuantity;
            }
        });
        App.Storage.save('basketCart', basket);
        initShoppingTable();
    });
    $('.spinedit i').click(function () {
        $("input[name='quantity']").blur();
    })
}

function totalPrice() {
    var totalPrice = 0;
    $('#shopcart .item-sum').each(function () {
        totalPrice += Number($(this).text());
    });
    $('#total-price').html(totalPrice);
}

function deleteItem() {
    $('#shopcart .delete').click(function () {
        var ind = $(this).closest("tr")[0].rowIndex;
        var basket = App.Storage.get('basketCart');
        basket.items.splice(ind - 1, 1);
        App.Storage.save('basketCart', basket);
        initShoppingTable();
        basketCount();
    })
}

function basketCount() {
    if (App.Storage.get('basketCart') != null) {
        var basket = App.Storage.get('basketCart');
        $('#top-bar .text-info').html(basket.items.length);
    } else {
        $('#top-bar .text-info').empty();
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
            $.get('${pageContext.request.contextPath}/rest/search', {'title': title},
                function (item) {
                    window.location.replace(App.link + "/clothing/" + item.clothing[0].id);
                },
                'json'
            );
        }
        //действие, выполняемое при выборе елемента из списка
    });
}