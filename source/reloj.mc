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
        var hora = time.hour;
        var minutos = time.min;
        var segundos = time.sec;
        var HoraMilitar = Application.getApp().getProperty("HorarioMilitar");
        //HoraMilitar = false;
        if (HoraMilitar==false) {
            if (hora > 12) {
                hora = hora - 12;
            } else if (hora == 0) {
                hora = 12;
            }
        }
        var hourText = hora.toString();
        var puntosTexto = ":";
        var minutosTexto = minutos.format("%02d");
        var font = WatchUi.loadResource(Rez.Fonts.numerosFont);
        var hourDimensions = dc.getTextDimensions(hourText, font);
        var puntosWidth = dc.getTextWidthInPixels(puntosTexto, font);
        var minutesWidth = dc.getTextWidthInPixels(minutosTexto, font);
        var totalWidth = hourDimensions[0] + puntosWidth + minutesWidth;    
        var height = (dc.getHeight() - hourDimensions[1]) / 2.2;
        var hourStart = (dc.getWidth() - totalWidth) / 2;
        var inicioPuntos = hourStart + hourDimensions[0];
        var minutesStart = inicioPuntos + puntosWidth;

        var colorHora = (Application.getApp().getProperty("ColorHora") as Number);
        dc.setColor(colorHora, Graphics.COLOR_TRANSPARENT);
        dc.drawText(hourStart, height, font, hourText, Graphics.TEXT_JUSTIFY_LEFT);

        dc.drawText(inicioPuntos, height, font, puntosTexto, Graphics.TEXT_JUSTIFY_LEFT);

        var colorMinuto = (Application.getApp().getProperty("ColorMinuto") as Number);
        dc.setColor(colorMinuto, Graphics.COLOR_TRANSPARENT);
        dc.drawText(minutesStart, height, font, minutosTexto, Graphics.TEXT_JUSTIFY_LEFT);
    }
}
