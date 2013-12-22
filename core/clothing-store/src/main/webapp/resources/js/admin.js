$(document).ready(function () {
    ititTables();
});

function ititTables() {
    var data_catalog_table = [];
    var table_catalog_params = {
        "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
        "aoColumns": [
            {
                "sTitle": "Id",
                "bSearchable": false,
                "bSortable": true
            },
            {
                "sTitle": "Модель",
                "bSearchable": true,
                "bSortable": true
            },
            {
                "sTitle": "Брэнд",
                "bSearchable": true,
                "bSortable": true
            },
            {
                "sTitle": "Категория",
                "bSearchable": true,
                "bSortable": true
            },
            {
                "sTitle": "Опции",
                "bSearchable": false,
                "bSortable": false
            }
        ],
        "aaData": data_catalog_table,
//        "bProcessing": true,
//        "bServerSide": true,
//        "sAjaxSource": appLink + "/rest/tables/clothing",
        "sPaginationType": "full_numbers"
    };
    App.Rest.clothing.done(function (data) {
        console.time('clothing list');
        $.each(data.clothings, function () {
            var item = [];
            var option = null;
            if (this.properties.visible) {
                option = '<i class="visible icon-eye-open"></i> <i class="icon-search"></i> <i class="icon-remove"></i>';
            } else {
                option = '<i class="visible icon-eye-close"></i> <i class="icon-search"></i> <i class="icon-remove"></i>';
            }
            item.push(this.id, this.title, this.brand.title, this.category.title, option);
            data_catalog_table.push(item);
        });
        console.timeEnd('clothing list');
        $('#table_catalog').dataTable(table_catalog_params);
    });

//    Навешиваем события на элементы таблицы
    $('#table_catalog').click(function (e) {
        var clicked = $(e.target);
        var id = clicked.closest('tr').find('td:first').html();
        switch (true) {
            case clicked.hasClass('icon-eye-open'):
                $.getJSON(App.Rest.link + '/clothing/' + id, function (data) {
                    data.properties.visible = false;
                    $.putJSON(App.Rest.link + '/clothing/' + id, data);
                });
                clicked.removeClass('icon-eye-open');
                clicked.addClass('icon-eye-close');
                break;
            case clicked.hasClass('icon-eye-close'):
                clicked.removeClass('icon-eye-close');
                clicked.addClass('icon-eye-open');
                break;
            case clicked.hasClass('icon-remove'):
                $('#modal-delete').modal();
                $("#modal-delete .delete-item").click(function () {
                    $.deleteItem(App.Rest.link + '/clothing/' + id);
                    $('#modal-delete').modal('hide');
                });
                break;
        }
    });
    $('#order-new').dataTable({
        "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
        "aaData": data_catalog_table,
//        "bProcessing": true,
//        "bServerSide": true,
//        "sAjaxSource": appLink + "/rest/tables/clothing",
        "sPaginationType": "full_numbers"
    });
// Таблица категорий
    App.Rest.categories.done(function (data) {
        $.each(data.categories, function () {
            $('#table_category tbody').append('<tr><td>' + this.title + '</td><td><i class="icon-eye-open"></i> <i class="icon-search"></i> <i class="icon-remove"></i></td></tr>');
        });
    });

    $('#example').dataTable({
        "sDom": "<'row'<'col-xs-6'T><'col-xs-6'f>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>",
//        "sAjaxSource": restAPI + "/order",
        "aoColumns": [
            { "mData": "browser" },
            { "mData": "engine" },
            { "mData": "platform" },
            { "mData": "version", "sClass": "center" },
            { "mData": "grade", "sClass": "center" }
        ],
        "aaData": data_catalog_table
    });
}
