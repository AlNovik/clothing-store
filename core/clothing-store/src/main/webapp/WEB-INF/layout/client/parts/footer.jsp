<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>

<footer id="footer-bar">
    <div class="row-fluid">
        <div class="span3">
            <h4>Навигация</h4>
            <ul>
                <li><a href="#">Главная</a></li>
                <li><a href="#">Каталог</a></li>
                <li><a href="#">О компании</a></li>
                <li><a href="#">Информация</a></li>
            </ul>
        </div>
        <div class="span3">
            <h4>Информация</h4>

            <div id="footer-information">
                Время работы: понедельник - пятница с 9:00 до 17:00 (Прием заказов: круглосуточно)
                Сведения о регистрации и другая необходимая информация по желанию
            </div>
        </div>
        <div class="span6">
            <h4>Контакты</h4>

            <div id="footer-contacts">
                <div class="contact-item">
                    <img src="${pageContext.request.contextPath}/resources/img/phone_2.png">

                    <div class="contact-info">
                        +375(29)123 45 67 <br>
                        +375(29)987 65 43
                    </div>
                </div>
                <div class="contact-item">
                    <img src="${pageContext.request.contextPath}/resources/img/email.png">

                    <div class="contact-info">
                        mail@mail.ru
                    </div>
                </div>
                <div class="contact-item">
                    <img src="${pageContext.request.contextPath}/resources/img/contacts.png">

                    <div class="contact-info">
                        Беларусь, г. Брест <br>
                        ул. Тра-та-та д.56 кв.45
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<section id="copyright">
    <span>Copyright 2013</span>
</section>