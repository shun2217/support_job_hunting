# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.7.1/dist/jquery.js"
pin "datatables.net", to: "https://ga.jspm.io/npm:datatables.net@2.2.2/js/dataTables.mjs"
pin "datatables.net-dt", to: "https://ga.jspm.io/npm:datatables.net-dt@2.2.2/js/dataTables.dataTables.mjs"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/turbo", to: "turbo.min.js"

