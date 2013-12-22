// Корзина покупок

var App = {
    link: appLink,
    Templates: {},
    Rest: {link: restAPI}
};

$(document).ready(function () {
    basketCount();
});

function addCart() {
    var basket;
    if ($.cookie('basketCart') == null) {
        basket = {items: []};
    } else {
        basket = $.evalJSON($.cookie('basketCart'));
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
    $.cookie('basketCart', $.toJSON(basket), { expires: 28, path: '/'});
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
    var basketItems = $.evalJSON($.cookie('basketCart'));
    var titles = [];
    $.each(basketItems.items, function () {
        titles.push(this.title);
    });
    $.getJSON(restAPI + '/search/clothing', {titles: titles},function (json) {
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
        var basket = $.evalJSON($.cookie('basketCart'));
        $.each(basket.items, function () {
            if (this.title == title && this.size == size) {
                this.quantity = newQuantity;
            }
        });
        $.cookie('basketCart', $.toJSON(basket), { expires: 28, path: '/'});
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
        var basket = $.evalJSON($.cookie('basketCart'));
        basket.items.splice(ind - 1, 1);
        $.cookie('basketCart', $.toJSON(basket), { expires: 28, path: '/'});
        initShoppingTable();
        basketCount();
    })
}

function basketCount() {
    if ($.evalJSON($.cookie('basketCart') != null)) {
        var basket = $.evalJSON($.cookie('basketCart'));
        $('.navbar .badge-info').html(basket.items.length);
    }
}