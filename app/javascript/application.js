// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import $ from "jquery"
import "@hotwired/turbo-rails"

window.$ = $
window.jQuery = $

import "datatables.net-dt"

document.addEventListener("turbo:load", () => {
  const table = document.querySelector('table[data-model]');
  if (table) {
    const model = table.dataset.model;
    $.getJSON(`/${model}.json`, function(response) {
      $(table).DataTable({
        columnDefs: [
          { targets: '_all', className: 'dt-center' }
        ],
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
      table.querySelectorAll(".copy-btn").forEach(btn => {
        btn.addEventListener("click", e => {
          e.preventDefault();
          const value = btn.dataset.value;
          if (!value) return;

          navigator.clipboard.writeText(value).then(() => {
            alert("コピーしました");
          }).catch(err => {
            console.error("コピーに失敗:", err);
          });
        });
      });
    });
  }
});

// Turboがキャッシュ保存する前にDataTableを破棄
document.addEventListener("turbo:before-cache", () => {
  const table = $('table[data-model]');
  if ($.fn.DataTable.isDataTable(table)) {
    table.DataTable().destroy();
  }
});

document.addEventListener('turbo:load', () => {
  const textarea = document.getElementById('answer-textarea');
  const counter = document.getElementById('answer-word-count');
  if (!textarea || !counter) return;

  const countChars = (text) => {
    return text.length;
  };

  const updateCount = () => {
    const chars = countChars(textarea.value);
    counter.textContent = `文字数: ${chars}`;
  };

  updateCount();
  textarea.addEventListener('input', updateCount);
});
