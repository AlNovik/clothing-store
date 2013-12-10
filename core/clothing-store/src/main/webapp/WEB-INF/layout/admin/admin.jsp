<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="utf-8">

    <link rel="stylesheet" href="${staticInTomcat}/resources/bootstrap/css/bootstrap.css">
    <link rel="stylesheet"
          href="${staticInTomcat}/resources/bootstrap/css/bootstrap-responsive.css">
    <link rel="stylesheet" href="${staticInTomcat}/resources/jQuery/css/jquery.dataTables.css">
    <link rel="stylesheet" href="${staticInTomcat}/resources/css/style.css">

    <script src="${staticInTomcat}/resources/jQuery/js/jquery-1.7.2.min.js"></script>
    <script src="${staticInTomcat}/resources/bootstrap/js/bootstrap.min.js"></script>
    <script src="${staticInTomcat}/resources/jQuery/js/jquery.dataTables.min.js"></script>
    <script src="${staticInTomcat}/resources/js/script.js"></script>
    <script>
        var appLink = window.location.origin + '${pageContext.request.contextPath}';
        var restLink = window.location.origin + window.location.pathname.replace('${pageContext.request.contextPath}', '${pageContext.request.contextPath}/rest');
    </script>
</head>
<body>

<div class="page-wrapper">
    <div class="container-fluid">
        <tiles:insertAttribute name="notification"/>
        <div class="row-fluid">
            <!-- SideBar -->
            <div class="span2">
                <tiles:insertAttribute name="sidebar"/>
            </div>

            <!-- Settings -->
            <div class="span10">
                <tiles:insertAttribute name="settings"/>
            </div>
        </div>
    </div>

    <tiles:insertAttribute name="footer"/>
</div>


</body>
</html>