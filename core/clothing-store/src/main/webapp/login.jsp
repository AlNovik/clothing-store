<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>

<!DOCTYPE html>
<html>
<head>
    <title>Магазин одежды // Авторизация</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="properties" content="">
    <meta name="author" content="">
    <meta charset="utf-8">

    <link rel="stylesheet" href="http://${pageContext.request.serverName}/resources/bootstrap/css/bootstrap.css">
    <link rel="stylesheet"
          href="http://${pageContext.request.serverName}/resources/bootstrap/css/bootstrap-responsive.css">

    <script src="http://${pageContext.request.serverName}/resources/jQuery/js/jquery-1.7.2.min.js"></script>
    <script src="http://${pageContext.request.serverName}/resources/bootstrap/js/bootstrap.min.js"></script>
    <script src="http://${pageContext.request.serverName}/resources/js/script.js"></script>

</head>
<body>

<div class="span4 offset4">
    <form method="post" class="form-horizontal well" action=""
          accept-charset="UTF-8">

        <fieldset>
            <legend>
                Авторизация
            </legend>
            <div class="control-group">
                <label class="control-label" for="username">
                    Логин
                </label>

                <div class="controls">
                    <input id="username" name="j_username" class="input-block-level" type="text">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="password">
                    Пароль
                </label>

                <div class="controls">
                    <input id="password" name="j_password" class="input-block-level" type="password">
                </div>
            </div>
            <div class="form-actions">
                <input class="btn" type="submit" id="sign-in" value="Войти"/>>
                <input style="float: left; margin-right: 10px;" type="checkbox"
                       id="remember-me" value="1">
                <label class="string optional">
                    Запомнить</label>
            </div>
        </fieldset>
    </form>
</div>

</body>
</html>