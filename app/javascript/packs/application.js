// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "controllers"

import $ from 'jquery';
import 'bootstrap/dist/js/bootstrap';
import 'daemonite-material/js/material';

import { Turbo, cable } from "@hotwired/turbo-rails";

ActiveStorage.start()

const images = require.context('../images', true);
