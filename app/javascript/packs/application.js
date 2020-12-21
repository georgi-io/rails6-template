// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "controllers"

import $ from 'jquery';
import 'bootstrap/dist/js/bootstrap';
import 'daemonite-material/js/material';

Rails.start()
Turbolinks.start()
ActiveStorage.start()

const images = require.context('../images', true);

$(document).on('turbolinks:load', function () {
  $('body').tooltip({
    selector: '[data-toggle="tooltip"]',
    container: 'body',
  }).popover({
    selector: '[data-toggle="popover"]',
    container: 'body',
    html: true,
    trigger: 'hover',
  });

  $(
    '.floating-label .custom-select, .floating-label .form-control',
  ).floatinglabel();
});
