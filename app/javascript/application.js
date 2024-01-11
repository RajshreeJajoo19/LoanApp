// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min';

import '@popperjs/core';
import 'bootstrap/dist/js/bootstrap';




const { environment } = require('@rails/webpacker');

const webpack = require('webpack');
environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  Popper: ['popper.js', 'default'],
}));

module.exports = environment;