<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>


<script src="/resources/jQuery/js/jquery.jqzoom-core.js"></script>


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
            $("input[name='quantity']").spinedit();
            $('.jqzoom').jqzoom({
                zoomType: 'reverse',
                zoomWidth:500,
                zoomHeight:500
            });
        });
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
                <a href="/resources/img/80137.jpg" class="jqzoom"  title="{{title}}" >
                    <img src="/resources/img/80137_small.jpg" title="{{title}}">
                </a>
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
                            <dd> {{#if height}}{{valuesString height}}
                                {{else}} не указано {{/if}}
                            </dd>
                            <dt>Доступные размеры :</dt>
                            <dd>{{#if size}}{{valuesString size}}
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
                                <input type="text" name="quantity">
                            </dd>
                        </dl>
                    </div>
                    <div class="span4">
                        <button id="add-cart-btn" class="btn btn-block span4" onclick="javascript:addCart()"><i
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

    <%--<div class="pdoduct-allphoto">--%>
        <%--<a href="${pageContext.request.contextPath}/resources/img/80137.jpg" class="image-zoom" title="MYTITLE">--%>
            <%--<img src="${pageContext.request.contextPath}/resources/img/assets_images_FANTAZIA_57_1.jpg"--%>
                 <%--title="IMAGE TITLE">--%>
        <%--</a>--%>
    <%--</div>--%>
</script>