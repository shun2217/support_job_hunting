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
        columns: response.columns.map(col => ({ title: col })),
        data: response.data
      });
    });
  }
});

