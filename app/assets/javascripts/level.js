jQuery.fn.flash = function (color, duration) {
   var current = this.css('backgroundColor');
   this.animate({ backgroundColor: 'rgb(' + color + ')' }, duration / 2)
   .animate({ backgroundColor: current }, duration / 2);
}
$(document).ready(function () {
  $('.xp-progress').each(function(i, obj) {

    $(this).delay(obj.dataset.wait).animate({width:obj.dataset.xp+"%"}, 600).flash("155, 223, 180", 400);
  });
});
