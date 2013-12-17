<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>

<link rel="stylesheet" href="/resources/bootstrap/css/fuelux-responsive.css">
<link rel="stylesheet" href="/resources/bootstrap/css/fuelux.css">
<link rel="stylesheet" href="/resources/jQuery/css/jquery.jqzoom.css">
<script src="${staticInTomcat}/resources/bootstrap/js/spinner.js"></script>
<%--<script src="/resources/jQuery/js/jquery.jqzoom-core.js"></script>--%>
<script src="http://www.fuelcdn.com/fuelux/2.4.1/loader.min.js"></script>

<div id="item"></div>


<script>
    $(document).ready(function () {
        var item = $('#product-item').html();
        var templateItem = Handlebars.compile(item);
        var itemData;
        $.getJSON(restLink, function (data) {
            itemData = data;
            var renderItem = templateItem(itemData);
            $('#item').html(renderItem);
        });
        $('#quantity').spinner();
//        $('.image-zoom').jqzoom();
    });
</script>

<script id="product-item" type="text/x-handlebars-template">
    <ul class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/index">Главная</a> <span class="divider">/</span></li>
        <li><a href="${pageContext.request.contextPath}/catalog/brand/{{brand.id}}">{{brand.title}}</a> <span
                class="divider">/</span></li>
        <li><a href="${pageContext.request.contextPath}/catalog/category/{{category.id}}">{{category.title}}</a> <span
                class="divider">/</span></li>
        <li>{{title}}</li>
    </ul>

    <div class="thumbnail item">
        <div class="row-fluid">
            <div class="span4">
                <img class="product-photo" src="/resources/img/80137.jpg" alt="{{title}}">
            </div>
            <div class="span8">
                <div class="row-fluid">
                    <div class="product-description">
                        <dl class="dl-horizontal">
                            <dt>Модель :</dt>
                            <dd id="product-title">{{title}}</dd>
                            <dt>Категория :</dt>
                            <dd>{{category.title}}</dd>
                            <dt>Брэнд :</dt>
                            <dd>{{brand.title}}</dd>
                            <dt>Рост :</dt>
                            <dd> {{#if height}}{{#each height}}{{this}}, {{/each}}
                                {{else}} не указано {{/if}}
                            </dd>
                            <dt>Доступные размеры :</dt>
                            <dd>{{#if size}}{{#each size}}{{this}}, {{/each}}
                                {{else}} не указано {{/if}}
                            </dd>
                            <dt>Доступные цвета :</dt>
                            <dd>на фото</dd>
                            <dt>Ткань :</dt>
                            <dd>на фото</dd>
                        </dl>
                        <div class="product-price">
                            <h1>{{price}} р.</h1>
                        </div>
                    </div>

                </div>
                <div id="product-addcart" class="row-fluid span10">
                    <div class="span8">
                        <dl class="dl-horizontal">
                            <dt>Размер :</dt>
                            <dd><select id="add-cart-size" class="span8">
                                {{#each size}}
                                <option value="{{this}}">{{this}}</option>
                                {{/each}}
                            </select></dd>
                            <dt>Цвет :</dt>
                            <dd><select class="span8">
                                <option>1</option>
                            </select></dd>
                            <dt>Количество:</dt>
                            <dd>
                                <div class="fuelux">
                                    <div id="quantity" class="spinner">
                                        <input type="text" class="input-mini spinner-input">

                                        <div class="spinner-buttons	btn-group btn-group-vertical">
                                            <button type="button" class="btn spinner-up">
                                                <i class="icon-chevron-up"></i>
                                            </button>
                                            <button type="button" class="btn spinner-down">
                                                <i class="icon-chevron-down"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </dd>
                        </dl>
                    </div>
                    <div class="span4">
                        <button id="add-cart-btn" class="btn btn-block span4" onclick="addCart()"><i
                                class="icon-shopping-cart"></i><br>В
                            корзину
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>
    </div>

    <h3> Все фотографии :</h3>

    <div class="pdoduct-allphoto">
        <a href="/resources/img/80137.jpg" class="image-zoom" title="MYTITLE">
            <img src="/resources/img/assets_images_FANTAZIA_57_1.jpg.ce19723794696a7d450fc4850919c696.jpg"
                 title="IMAGE TITLE">
        </a>
    </div>
</script>

<script>
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
                    this.quantity += parseInt($('#quantity input').val(), 10);
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
    }

    function addItemToCart() {
        var item = {};
        item.title = $('#product-title').text();
        item.size = parseInt($('#add-cart-size').val(), 10);
        item.quantity = parseInt($('#quantity input').val(), 10);
        return item;
    }
</script>