using Toybox.Graphics;
using Toybox.Lang;
using Toybox.System;
using Toybox.WatchUi;
using Toybox.Time.Gregorian as Date;
using Toybox.Application;

class reloj extends WatchUi.Drawable {

    function initialize(options) {
        Drawable.initialize(options);
    }

    function draw(dc) {
        var time = System.getClockTime();
        var hora = time.hour;
        var minutos = time.min;
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
        //var horaText = hora.toString();
        var horaText = hora.format("%02d");
        var puntosTexto = ":";
        var minutosTexto = minutos.format("%02d");
        //fuentes
        var font = Graphics.FONT_NUMBER_THAI_HOT;
        var font215_180 = Graphics.FONT_NUMBER_HOT;
        //calculo dimensiones 
        var horaDimensions = dc.getTextDimensions(horaText, font);
        var puntosWidth = dc.getTextWidthInPixels(puntosTexto, font);
        var minutesWidth = dc.getTextWidthInPixels(minutosTexto, font);
        var totalWidth = horaDimensions[0] + puntosWidth + minutesWidth; 
        //calculo localizacion esfera
        var height = (dc.getHeight() - horaDimensions[0]) / 2;
        var hourStart = (dc.getWidth() - totalWidth) / 2;
        var inicioPuntos = hourStart + horaDimensions[0];
        var minutosStart = inicioPuntos + puntosWidth;
        //impresion en esfera
        var esfera = System.getDeviceSettings();
        var ancho = esfera.screenWidth;
        var alto = esfera.screenHeight;

        var colorHora = (Application.getApp().getProperty("ColorHora"));
        var colorMinuto = (Application.getApp().getProperty("ColorMinuto"));

        if (ancho == 215 && alto == 180) {
            height = (dc.getHeight() - horaDimensions[1]) / 1.4;
            dc.setColor(colorHora, Graphics.COLOR_TRANSPARENT);
            dc.drawText((hourStart + 25), height+10, font215_180, horaText, Graphics.TEXT_JUSTIFY_LEFT);
            dc.drawText(inicioPuntos, height+10, font215_180, puntosTexto, Graphics.TEXT_JUSTIFY_LEFT);            
            dc.setColor(colorMinuto, Graphics.COLOR_TRANSPARENT);
            dc.drawText(minutosStart-5, height+10, font215_180, minutosTexto, Graphics.TEXT_JUSTIFY_LEFT);         
        } else if (ancho == 218 && alto == 218) {
            height = (dc.getHeight() - horaDimensions[1]) / 2.1;
            dc.setColor(colorHora, Graphics.COLOR_TRANSPARENT);
            dc.drawText((hourStart + 5), height+10, font215_180, horaText, Graphics.TEXT_JUSTIFY_LEFT);
            dc.drawText(inicioPuntos, height+10, font215_180, puntosTexto, Graphics.TEXT_JUSTIFY_LEFT);            
            dc.setColor(colorMinuto, Graphics.COLOR_TRANSPARENT);
            dc.drawText((minutosStart + 5), height+10, font215_180, minutosTexto, Graphics.TEXT_JUSTIFY_LEFT);          
        } else {
            dc.setColor(colorHora, Graphics.COLOR_TRANSPARENT);
            dc.drawText(hourStart, height+2, font, horaText, Graphics.TEXT_JUSTIFY_LEFT);
            dc.drawText(inicioPuntos, height+2, font, puntosTexto, Graphics.TEXT_JUSTIFY_LEFT);            
            dc.setColor(colorMinuto, Graphics.COLOR_TRANSPARENT);
            dc.drawText(minutosStart, height+2, font, minutosTexto, Graphics.TEXT_JUSTIFY_LEFT);                  
        }                      
    }        
}
