<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>

<a href="${pageContext.request.contextPath}/admin/products" class="btn"> << Назад</a>
<%--<div class="row-fluid">--%>
<%--<div class="span8 offset2">--%>
<form class="form-horizontal well" id="newProduct">
    <legend>
        Новый товар
    </legend>
    <div class="row-fluid">
        <div class="span9">
            <div class="control-group">
                <input class="span12" type="text" id="title" name="title" placeholder="Название">
                <span class="help-block"></span>
            </div>
        </div>

        <div class="offset1 span2">
            <div class="control-group">
                <label class="checkbox">
                    <input type="checkbox" id="visible" value="true" name="visible">Отображать
                </label>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span5">
            <div class="control-group">
                <label class="control-label" for="brand">Брэнд</label>

                <div class="controls">
                    <select class="span12" id="brand" name="brand">
                        <option>Выбрать</option>
                        <option value="1">Первый</option>
                    </select>
                    <span class="help-block"></span>
                </div>
            </div>
        </div>
        <div class="span5">
            <div class="control-group">
                <label class="control-label" for="category">Категория</label>

                <div class="controls">
                    <select class="span12" id="category" name="category">
                        <option>Выбрать</option>
                        <option value="1">Первый</option>
                    </select>
                    <span class="help-block"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">Размеры</label>

        <div class="controls">
            <label class="checkbox inline">
                <input type="checkbox" id="size_36" value="36" name="size"> 36
            </label>
            <label class="checkbox inline">
                <input type="checkbox" id="size_38" value="38" name="size"> 38
            </label>
            <label class="checkbox inline">
                <input type="checkbox" id="size_40" value="40" name="size"> 40
            </label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">Рост</label>

        <div class="controls">
            <label class="checkbox inline">
                <input type="checkbox" id="height_162" value="162" name="height"> 162
            </label>
            <label class="checkbox inline">
                <input type="checkbox" id="height_170" value="170" name="height"> 170
            </label>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label">Другие характеристики</label>

        <div class="controls">
            <div class="row-fluid">
                <div class="span4">
                    <h5>Цвет</h5>
                    <select multiple="multiple">
                        <option>красный</option>
                        <option>синий</option>
                        <option>черный</option>
                        <option>коричневый</option>
                        <option>желтый</option>
                    </select>
                </div>
                <div class="span4">
                    <h5>Ткань</h5>
                    <select multiple="multiple">
                        <option>хлопок</option>
                        <option>сатин</option>
                        <option>кружева на сатине</option>
                        <option>шерсть</option>
                        <option>трикотаж</option>
                    </select>
                </div>
                <div class="span4">
                    <h5>Сезонность</h5>
                    <select multiple="multiple">
                        <option>нарядное</option>
                        <option>зима</option>
                        <option>лето</option>
                        <option>осень-зима</option>
                        <option>5</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="price">
            Цена
        </label>

        <div class="controls">
            <div class="input-append">
                <input class="span10" id="price" size="16" type="number" name="price"><span class="add-on">.руб</span>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <h4>Свойства страницы</h4>

            <div class="control-group">
                <label class="control-label">URL</label>

                <div class="controls">
                    <label class="span3">/clothing/</label>
                    <input type="text" class="offset3 span9" id="url" name="url">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Title</label>

                <div class="controls">
                    <input type="text" id="title-page">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Keywords</label>

                <div class="controls">
                    <input type="text" id="keywords">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Описание</label>

                <div class="controls">
                    <input type="text" id="properties-page">
                </div>
            </div>
        </div>
        <div class="span6">
            <h4>Картинки</h4>

            <div style="padding:20px">

                <input id="fileupload" type="file" name="files[]" data-url="/rest/file/upload" multiple>

                <div id="dropzone">Drop files here</div>

                <div id="progress">
                    <div style="width: 0%;"></div>
                </div>

                <table id="uploaded-files">
                    <tr>
                        <th>File Name</th>
                        <th>File Size</th>
                        <th>File Type</th>
                        <th>Download</th>
                    </tr>
                </table>

            </div>
        </div>
    </div>


    <div class="control-group">
        <h4>Описание</h4>
        <textarea class="span10" placeholder="Описание..." style="height: 200px" id="description" name="description"></textarea>
    </div>

    <div class="form-actions">
        <button type="submit" class="btn btn-primary">Добавить</button>
    </div>
</form>
<%--</div>--%>
<%--</div>--%>


<script>

    $(document).ready(function () {
        $("#title").syncTranslit({destination: "url"});

        // Save Person AJAX Form Submit
        $('#newProduct').submit(function (e) {
            // will pass the form data using the jQuery serialize function
            $.post(restAPI + '/clothing', $(this).serialize(),function (response) {
//                $('#personFormResponse').text(response);
            }).success(function () {
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
    });
    $('#description').wysihtml5({
        "font-styles": true, //Font styling, e.g. h1, h2, etc. Default true
        "emphasis": true, //Italics, bold, etc. Default true
        "lists": true, //(Un)ordered lists, e.g. Bullets, Numbers. Default true
        "html": true, //Button which allows you to edit the generated HTML. Default false
        "link": true, //Button to insert a link. Default true
        "image": true, //Button to insert an image. Default true,
        "color": true //Button to change color of font
    });

    $(function () {
        $('#fileupload').fileupload({
            dataType: 'json',

            done: function (e, data) {
                $("tr:has(td)").remove();
                $.each(data.result, function (index, file) {

                    $("#uploaded-files").append(
                            $('<tr/>')
                                    .append($('<td/>').text(file.fileName))
                                    .append($('<td/>').text(file.fileSize))
                                    .append($('<td/>').text(file.fileType))
                                    .append($('<td/>').html("<a href='/rest/file/get/" + index + "'>Click</a>"))
                    )//end $("#uploaded-files").append()
                });
            },

            progressall: function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#progress .bar').css(
                        'width',
                        progress + '%'
                );
            },

            dropZone: $('#dropzone')
        });
    });
</script>
<style>
    #dropzone {
        background: #ccc;
        width: 150px;
        height: 50px;
        line-height: 50px;
        text-align: center;
        font-weight: bold;
    }

    #dropzone.in {
        width: 600px;
        height: 200px;
        line-height: 200px;
        font-size: larger;
    }

    #dropzone.hover {
        background: lawngreen;
    }

    #dropzone.fade {
        -webkit-transition: all 0.3s ease-out;
        -moz-transition: all 0.3s ease-out;
        -ms-transition: all 0.3s ease-out;
        -o-transition: all 0.3s ease-out;
        transition: all 0.3s ease-out;
        opacity: 1;
    }
</style>