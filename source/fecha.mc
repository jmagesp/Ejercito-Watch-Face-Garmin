using Toybox.Graphics;
using Toybox.Lang;
using Toybox.Time;
using Toybox.WatchUi;
using Toybox.Time.Gregorian as Date;
using Toybox.Application;
using Toybox.System;

class fecha extends WatchUi.Drawable {

    function initialize(options) {
        Drawable.initialize(options);
    }

    function draw(dc) {
        var fecha = Date.info(Time.now(), Time.FORMAT_MEDIUM);
    
        var formatString = "$1$/$2$";

        var x = dc.getWidth() / 2;
        var y = dc.getHeight() * .05;
        var font = WatchUi.loadResource(Rez.Fonts.QuanticoSmall);
        var text = Lang.format(formatString, [fecha.day, fecha.month]);

        dc.setColor(Graphics.COLOR_YELLOW, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y, font, text, Graphics.TEXT_JUSTIFY_CENTER);
    }
}
