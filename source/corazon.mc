using Toybox.Activity;
using Toybox.ActivityMonitor;
using Toybox.Graphics;
using Toybox.WatchUi;
using Toybox.Time;
using Toybox.Time.Gregorian as Date;

class corazon extends WatchUi.Drawable {
    var iconoFont = WatchUi.loadResource(Rez.Fonts.IconosFont);
    var textoFont = WatchUi.loadResource(Rez.Fonts.numeros);

    function initialize(options) {
        Drawable.initialize(options);
    }

    function textoLatidos() {
        var SensorLatidos = Application.getApp().getProperty("SensorLatidos");
        var heartRate = Activity.Info.currentHeartRate;
        var heartRateText = "--";

        if (heartRate != null) {
            heartRateText = heartRate.format("%d");
        } else if (ActivityMonitor has :getHeartRateHistory) {
            heartRate = ActivityMonitor.getHeartRateHistory(1, true).next();
            if ((heartRate != null) && (heartRate.heartRate != ActivityMonitor.INVALID_HR_SAMPLE)) {
                heartRateText = heartRate.heartRate.format("%d");
            }			
        } else {
            heartRateText = "--";
        }                         
        return heartRateText;
    }

    function textoPasos() {
        var pasos = ActivityMonitor.getInfo().steps;
        var pasosText = "--";
        if (pasos != null) {
            pasosText = pasos.format("%d");
        }
        return pasosText;
    }

    function textoCalorias() {
        var calories = ActivityMonitor.getInfo().calories;
        var caloriasTexto = "--";
        if (calories != null) {
            caloriasTexto = calories.format("%d");
        }
        return caloriasTexto;
    }

    function draw(dc) {
        var x = dc.getWidth(); // ancho
        var y = dc.getHeight() * .21; //alto

        var hrText = textoLatidos();
        var hrIcon = "l";  //codigo ascii
        var hrTextDimensions = dc.getTextDimensions(hrText, textoFont);
        var hrIconDimensions = dc.getTextDimensions(hrIcon, iconoFont);
        
        var pasosTexto = textoPasos();
        var pasosIcono = "Å";
        var secondaryTextDimensions = dc.getTextDimensions(pasosTexto, textoFont);
        var secondaryIconDimensions = dc.getTextDimensions(pasosIcono, iconoFont);
        var width = hrIconDimensions[0] + hrTextDimensions[0] + secondaryIconDimensions[0] + secondaryTextDimensions[0] + 12;

        var hrIconStart = (x - width) / 2.3; // ancho inicio icono corazon
        dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
        dc.drawText(hrIconStart, y, iconoFont, hrIcon, Graphics.TEXT_JUSTIFY_LEFT);        

        var hrTextStart = hrIconStart + hrIconDimensions[0] + 4; //espacios entre icono y texto
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(hrTextStart, y, textoFont, hrText, Graphics.TEXT_JUSTIFY_LEFT);  

        var secondaryIconStart = hrTextStart + hrTextDimensions[0] + 4;//espacios entre icono y texto
        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(secondaryIconStart, y, iconoFont, pasosIcono, Graphics.TEXT_JUSTIFY_LEFT);

        var secondaryTextStart = secondaryIconStart + secondaryIconDimensions[0] + 4; //espacios entre icono y texto
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(secondaryTextStart, y, textoFont, pasosTexto, Graphics.TEXT_JUSTIFY_LEFT);        

        //dibujo bandera lineal
        dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(3);
        dc.drawLine(hrIconStart - 30, y + 35 ,hrIconStart + 20, y + 35); //x1 inicio, y1 inicio, x2 fin, y2 fin

        dc.setColor(Graphics.COLOR_YELLOW, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(3);
        dc.drawLine(hrIconStart + 40, y + 35 ,hrIconStart + 90, y + 35); //x1 inicio, y1 inicio, x2 fin, y2 fin

        dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(3);
        dc.drawLine(hrIconStart + 110, y + 35 ,hrIconStart + 160, y + 35); //x1 inicio, y1 inicio, x2 fin, y2 fin

        var Fecha_Calorias = Application.getApp().getProperty("Fecha_Calorias");
        if (Fecha_Calorias == true){
            var fecha = Date.info(Time.now(), Time.FORMAT_MEDIUM);
    
            var formatString = "$1$/$2$";

            var xFecha = dc.getWidth() / 2;
            var yFecha = dc.getHeight() * .05;
            var fechaFont = WatchUi.loadResource(Rez.Fonts.QuanticoSmall);
            var fechaTexto = Lang.format(formatString, [fecha.day, fecha.month]);

            dc.setColor(Graphics.COLOR_YELLOW, Graphics.COLOR_TRANSPARENT);
            dc.drawText(xFecha, yFecha, fechaFont, fechaTexto, Graphics.TEXT_JUSTIFY_CENTER);
        } else {
            //icono calorias
            var caloriasTexto = textoCalorias();
            var caloriasIcono = "X";      
            
            var caloriasIconDimensions = dc.getTextDimensions(caloriasIcono, iconoFont);     
            var xCalorias = dc.getWidth() / 2.7; // ancho
            var yCalorias = dc.getHeight() * .05; //alto   

            dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_TRANSPARENT);
            dc.drawText(xCalorias, yCalorias, iconoFont, caloriasIcono, Graphics.TEXT_JUSTIFY_LEFT);

            var caloriasTextStart = xCalorias + caloriasIconDimensions[0] + 4; //espacios entre icono y texto
            dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
            dc.drawText(caloriasTextStart, yCalorias, textoFont, caloriasTexto, Graphics.TEXT_JUSTIFY_LEFT);
        }         
    }
}
