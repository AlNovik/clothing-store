<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>

<script>
    $(document).ready(function() {
        $('.jqzoom').jqzoom({
            zoomType: 'reverse',
            preloadImages: true
        });
    });
</script>

<div style="display:inline-block">
    <a href="/resources/img/80137.jpg" class="jqzoom" rel='gal1'  title="triumph" >
        <img src="/resources/img/80137_small.jpg"  title="triumph"  style="border: 2px solid silver;"/>
    </a>
</div>

<br/>


<a class="zoomThumbActive" href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: '/resources/img/80137_small.jpg',largeimage: '/resources/img/80137.jpg'}">
    <img src='/resources/img/80137_th.jpg'/></a>
<a href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: '/resources/img/1251_small.jpg',largeimage: '/resources/img/1251.jpg'}">
    <img src='/resources/img/1251_th.jpg'/></a>

<a  href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: '/resources/img/1441-2_small.jpg',largeimage: '/resources/img/1441-2.jpg'}">
    <img src='/resources/img/1441-2_th.jpg'/></a>
