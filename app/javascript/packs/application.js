// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
import { initPartitionCable, initScroll } from '../channels/partition_channel';



import { initSelect2 } from '../components/init_select2';
import { initDropDown } from "../components/dropdown-sidebar";

document.addEventListener("turbolinks:load", function () {
  initSelect2();
  initDropDown();
  initPartitionCable();
  initScroll();
  const commentScroll = document.getElementById('comments-scroll')
  if (commentScroll) {
    commentScroll.scrollTo(0, document.getElementById('comments').offsetHeight);
  }
});

// document.getElementById('comments-scroll').addEventListener("click", document.getElementById('comments-scroll').scrollTo(0, document.getElementById('comments').offsetHeight));

console.log("Hello from app/javascript/packs/application.js!");
