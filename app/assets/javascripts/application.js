// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(function(){ $(document).foundation(); });
// GET THE TOTAL FROM THE PAGE
$('#cash_out').click(function(){
  var COINS_AND_BILLS = [2000, 1000, 500, 100, 25, 10, 5, 1];
  var give = [];
  var total = parseInt($('#hidden_total').text());
  var given = parseInt(prompt("Cash given:")) * 100;
  var remainder = given - total;
  while(given < total){
    given = parseInt(prompt("Not enough, try again:")) * 100;
    remainder = given - total;
  }
  var change = remainder / 100.00;
  change = "$" + change.toFixed(2);
  while(remainder > 0) {
    for(var i = 0; i < COINS_AND_BILLS.length; i++) {
      var value = COINS_AND_BILLS[i];
      if(remainder >= value) {
        var v = value / 100.00;
        give.push("$" + v.toFixed(2));
        remainder = remainder - value;
        break;
      }
    }
  }
  alert("Cash to give: " + change + "\n" + give);
});
