// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import $ from "jquery"
import "@hotwired/turbo-rails"

window.$ = $
window.jQuery = $

import "datatables.net-dt"

document.addEventListener("turbo:load", () => {
  const table = document.querySelector('#companies-table');
  if (table) {
    $.getJSON("/companies.json", function(response) {
      $(table).DataTable({
        "language": {
          "sEmptyTable":     "データがありません",
          "sInfo":           "_START_ 〜 _END_ 件／全 _TOTAL_ 件",
          "sInfoEmpty":      "0 〜 0 件／全 0 件",
          "sInfoFiltered":   "(全 _MAX_ 件よりフィルタリング)",
          "sInfoPostFix":    "",
          "sLengthMenu":     "_MENU_ 件表示",
          "sLoadingRecords": "読み込み中...",
          "sProcessing":     "処理中...",
          "sSearch":         "検索:",
          "sZeroRecords":    "一致するレコードがありません",
          "oPaginate": {
            "sFirst":    "先頭",
            "sPrevious": "前",
            "sNext":     "次",
            "sLast":     "最終"
          },
          "oAria": {
            "sSortAscending":  ": 昇順に並べ替え",
            "sSortDescending": ": 降順に並べ替え"
          },
        },
        columns: response.columns.map(col => ({ title: col })),
        data: response.data
      });
    });
  }
});

// Turboがキャッシュ保存する前にDataTableを破棄
document.addEventListener("turbo:before-cache", () => {
  const table = $('#companies-table');
  if ($.fn.DataTable.isDataTable(table)) {
    table.DataTable().destroy();
  }
});