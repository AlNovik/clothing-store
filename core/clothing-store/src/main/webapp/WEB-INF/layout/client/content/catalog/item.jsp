<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>


<ul class="breadcrumb">
    <li><a href="${pageContext.request.contextPath}/index">Главная</a> <span class="divider">/</span></li>
</ul>

<div class="item">

</div>


<script>
    $.getJSON(restLink, function (json) {
        $('.breadcrumb li')
                .after('<li>' + json.model + '</li>')
                .after('<li><a href="${pageContext.request.contextPath}/category/' + json.category.id + '">' + json.category.title + '</a> <span class="divider">/</span></li>')
                .after('<li><a href="${pageContext.request.contextPath}/brand/' + json.brand.id + '">' + json.brand.title + '</a> <span class="divider">/</span></li>');
        $('.item').append('<div class="span4"><img src="' + json.images[0].link + '"></div>');
        $('.item').append('<div class="span6 offset4"><p>Модель : ' + json.model + '</p>' +
                '<p>Категория : ' + json.category.title + '</p>' +
                '<p>Брэнд : ' + json.brand.title + '</p>' +
                '<p>Рост : ' + json.model + '</p>' +
                '<p>Доступные размеры : ' + json.model + '</p>' +
                '<p>Доступные цвета : на фото</p>' +
                '<p>Ткань : ' + json.model + '</p></div>')
    })
</script>