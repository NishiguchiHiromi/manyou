# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).ready ->
    $('.datetimepicker').datetimepicker({
      locale: moment.locale('en'),
      format : 'DD.MM.YYYY',
      icons: {
        time: "fa fa-clock-o",
        date: "fa fa-calendar",
        up: "fa fa-arrow-up",
        down: "fa fa-arrow-down",
        previous: "fa fa-arrow-left",
        next: "fa fa-arrow-right"
    }})
