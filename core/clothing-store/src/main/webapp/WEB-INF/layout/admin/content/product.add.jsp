<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%--<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>--%>


<div class="modal hide fade modal-admin" id="modal-product-add" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3>Добавить товый товар</h3>
    </div>
    <form class="form-horizontal" id="newProduct">
        <div class="modal-body well">

            <div class="row-fluid">
                <div class="span6" style="margin-left: 100px">
                    <div class="control-group">
                        <input class="span12" type="text" name="title" placeholder="Название">
                        <span class="help-block"></span>
                    </div>
                </div>

                <div class="offset1 span2">
                    <div class="control-group">
                        <label class="checkbox">
                            <input type="checkbox" id="visible" value="true" name="properties.visible">Отображать
                        </label>
                    </div>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span4" id="select-brand">
                    <div class="control-group">
                        <label class="control-label" for="brand">Брэнд</label>

                        <div class="controls">
                        </div>
                    </div>
                </div>
                <div class="span4" id="select-category">
                    <div class="control-group">
                        <label class="control-label" for="category">Категория</label>

                        <div class="controls">
                        </div>
                    </div>
                </div>
            </div>
            <div class="control-group" id="select-size">
                <label class="control-label">Размеры</label>

                <div class="span6">
                    <div class="controls">

                    </div>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Рост</label>

                <div class="controls">
                    <label class="checkbox inline">
                        <input type="checkbox" value="162" name="height"> 162
                    </label>
                    <label class="checkbox inline">
                        <input type="checkbox" value="170" name="height"> 170
                    </label>
                </div>
            </div>
            <h4>Другие характеристики</h4>

            <div class="control-group">
                <label class="control-label">Цвет</label>

                <div class="controls">
                    <input type="text" value="" data-role="tagsinput" name="color" class="span6"
                           placeholder="Введите доступные цвета..."/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Ткань</label>

                <div class="controls">
                    <input type="text" value="" data-role="tagsinput" name="cloth" class="span6"
                           placeholder="Введите доступные ткани..."/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Сезонность</label>

                <div class="controls">
                    <input type="text" value="" data-role="tagsinput" name="season" class="span6"
                           placeholder="Сезонность..."/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="price">
                    Цена
                </label>

                <div class="controls">
                    <div class="input-append">
                        <input class="span10" id="price" size="16" type="number" name="price"><span
                            class="add-on">.руб</span>
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
                            <input type="text" class="offset3 span9" id="url-product" name="properties.url">
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
                <textarea class="span10" placeholder="Описание..." style="height: 200px"
                          name="description"></textarea>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">Отмена</button>
            <button class="btn btn-success" type="submit">Добавить</button>
        </div>
    </form>
</div>


<script id="selected-brand" type="text/x-handlebars-template">
    <select class="span12" id="brand" name="brand.id">
        <option disabled>Выбрать</option>
        {{#each brands}}
        <option value="{{id}}">{{title}}</option>
        {{/each}}
    </select>
    <span class="help-block"></span>
</script>
<script id="selected-category" type="text/x-handlebars-template">
    <select class="span12" id="category" name="category.id">
        <option disabled>Выбрать</option>
        {{#each categories}}
        <option value="{{id}}">{{title}}</option>
        {{/each}}
    </select>
    <span class="help-block"></span>
</script>
<script id="selected-size" type="text/x-handlebars-template">
    {{select-size-checkbox}}
</script>