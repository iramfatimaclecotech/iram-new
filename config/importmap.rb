# Pin npm packages by running ./bin/importmap
#pin "stimulus", to: "stimulus.js", preload: true
#pin "application", preload: true, to: "/assets/application.js"
pin "stimulus", to: "https://unpkg.com/stimulus@2.0.0/dist/stimulus.umd.js"
pin "stimulus_reflex", to: "https://unpkg.com/stimulus_reflex@3.4.0/dist/stimulus_reflex.umd.js"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
# pin "jquery", to: "jquery.min.js", preload: true
# pin "jquery_ujs", to: "jquery_ujs.js", preload: true
pin "popper", to: "popper.js", preload: true
pin "bootstrap", to: "bootstrap.min.js", preload: true
