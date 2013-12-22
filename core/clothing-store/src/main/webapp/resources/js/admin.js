$(document).ready(function () {
    ititTables();
});

function ititTables() {
    var data_catalog_table = [];
    var table_catalog_params = {
        "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
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
    $.getJSON(appLink + '/rest/clothing', function (json) {
        $.each(json.clothings, function () {
            var item = [];
            item.push(this.id, this.title, this.brand.title, this.category.title, '<i class="icon-eye-open"></i> <i class="icon-search"></i> <i class="icon-remove"></i>');
            data_catalog_table.push(item);
        });
        $('#table_catalog').dataTable(table_catalog_params);
    });
// Таблица категорий
    $.getJSON(appLink + '/rest/category', function (json) {
        $.each(json.categories, function () {
            $('#table_category tbody').append('<tr><td>' + this.title + '</td><td><i class="icon-eye-open"></i> <i class="icon-search"></i> <i class="icon-remove"></i></td></tr>');
        });
    });

    $('#example').dataTable({
        "sDom": "<'row'<'col-xs-6'T><'col-xs-6'f>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>",
        "sAjaxSource": restAPI + "/order",
        "aoColumns": [
            { "mData": "browser" },
            { "mData": "engine" },
            { "mData": "platform" },
            { "mData": "version", "sClass": "center" },
            { "mData": "grade", "sClass": "center" }
        ]
    });
}