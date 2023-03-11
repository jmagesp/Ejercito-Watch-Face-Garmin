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
        //texto
        var horaText = hora.toString();
        var puntosTexto = ":";
        var minutosTexto = minutos.format("%02d");
        var segundosTexto = segundos.format("%02d");
        //fuentes
        var font = WatchUi.loadResource(Rez.Fonts.numerosFont);
        var fuenteSec = WatchUi.loadResource(Rez.Fonts.numerosSec);
        //calculo dimensiones
        var horaDimensions = dc.getTextDimensions(horaText, font);
        var minutoDimensions = dc.getTextDimensions(minutosTexto, font);
        var puntosWidth = dc.getTextWidthInPixels(puntosTexto, font);
        var minutesWidth = dc.getTextWidthInPixels(minutosTexto, font);
        var segundosWidth = dc.getTextWidthInPixels(segundosTexto, fuenteSec);
        var totalWidth = horaDimensions[0] + puntosWidth + minutesWidth + 35; //+ segundosWidth (no vale) sumamos 35 para esferas 208
        //calculo localizacion esfera
        var heightSegundos = dc.getHeight() / 2.2;
        var height = (dc.getHeight() - horaDimensions[1]) / 2.2;
        var hourStart = (dc.getWidth() - totalWidth) / 2;
        var inicioPuntos = hourStart + horaDimensions[0];
        var minutosStart = inicioPuntos + puntosWidth;
        var segundosStart = minutosStart + minutesWidth;
        //impresion n esfera
        var colorHora = (Application.getApp().getProperty("ColorHora") as Number);
        dc.setColor(colorHora, Graphics.COLOR_TRANSPARENT);
        dc.drawText(hourStart, height, font, horaText, Graphics.TEXT_JUSTIFY_LEFT);

        dc.drawText(inicioPuntos, height, font, puntosTexto, Graphics.TEXT_JUSTIFY_LEFT);

        var colorMinuto = (Application.getApp().getProperty("ColorMinuto") as Number);
        dc.setColor(colorMinuto, Graphics.COLOR_TRANSPARENT);
        dc.drawText(minutosStart, height, font, minutosTexto, Graphics.TEXT_JUSTIFY_LEFT);

        var colorSegundo = (Application.getApp().getProperty("ColorSegundo") as Number);
        dc.setColor(colorSegundo, Graphics.COLOR_TRANSPARENT);
        dc.drawText(segundosStart, heightSegundos, fuenteSec, segundosTexto, Graphics.TEXT_JUSTIFY_LEFT);
    }
}
