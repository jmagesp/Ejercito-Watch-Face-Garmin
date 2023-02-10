using Toybox.Graphics;
using Toybox.Lang;
using Toybox.System;
using Toybox.WatchUi;

class reloj extends WatchUi.Drawable {

    function initialize(options) {
        Drawable.initialize(options);
    }

    function draw(dc) {
        var time = System.getClockTime();
        var hours = time.hour;
        var minutes = time.min;
        var HoraMilitar = Application.getApp().getProperty("HorarioMilitar");
        if (HoraMilitar==false) {
            if (hours > 12) {
                hours = hours - 12;
            } else if (hours == 0) {
                hours = 12;
            }
        }
        var hourText = hours.toString();
        var colonText = ":";
        var minutesText = minutes.format("%02d");
        var font = WatchUi.loadResource(Rez.Fonts.numerosFont);
        var hourDimensions = dc.getTextDimensions(hourText, font);
        var colonWidth = dc.getTextWidthInPixels(colonText, font);
        var minutesWidth = dc.getTextWidthInPixels(minutesText, font);
        var totalWidth = hourDimensions[0] + colonWidth + minutesWidth;    
        var height = (dc.getHeight() - hourDimensions[1]) / 2.3;
        var hourStart = (dc.getWidth() - totalWidth) / 2;
        var colonStart = hourStart + hourDimensions[0];
        var minutesStart = colonStart + colonWidth;
        var colorHora = (Application.getApp().getProperty("ColorHora") as Number);
        dc.setColor(colorHora, Graphics.COLOR_TRANSPARENT);
        dc.drawText(hourStart, height, font, hourText, Graphics.TEXT_JUSTIFY_LEFT);
        dc.drawText(colonStart, height, font, colonText, Graphics.TEXT_JUSTIFY_LEFT);
        var colorMinuto = (Application.getApp().getProperty("ColorMinuto") as Number);
        dc.setColor(colorMinuto, Graphics.COLOR_TRANSPARENT);
        dc.drawText(minutesStart, height, font, minutesText, Graphics.TEXT_JUSTIFY_LEFT);
    }
}
