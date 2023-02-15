using Toybox.Activity;
using Toybox.ActivityMonitor;
using Toybox.Graphics;
using Toybox.WatchUi;

class corazon extends WatchUi.Drawable {
    var iconoFont = WatchUi.loadResource(Rez.Fonts.IconosFont);
    var textoFont = WatchUi.loadResource(Rez.Fonts.numeros);

    var verCalorias  = true;

    function initialize(options) {
        Drawable.initialize(options);
    }

    function textoLatidos() {
        var SensorLatidos = Application.getApp().getProperty("SensorLatidos");
        var heartRate = Activity.Info.currentHeartRate;
        var heartRateText = "--";

        //var heartrateIterator = ActivityMonitor.getHeartRateHistory(1, true);
        //heartRate = heartrateIterator.next().heartRate;
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
        var y = dc.getHeight() * .2; //alto

        var hrText = textoLatidos();
        var hrIcon = "l";  //codigo ascii
        var hrTextDimensions = dc.getTextDimensions(hrText, textoFont);
        var hrIconDimensions = dc.getTextDimensions(hrIcon, iconoFont);

        // Cada 5 segundos, cambia entre calorias y pasos
        var time = System.getClockTime();
        if (time.sec % 5 == 0) {
            verCalorias = !verCalorias;
        }
        //icono codigo ascii cambio
        var secondaryText = verCalorias ? textoCalorias() : textoPasos();
        var secondaryIcon = verCalorias ? "X" : "Å";
        
        var secondaryTextDimensions = dc.getTextDimensions(secondaryText, textoFont);
        var secondaryIconDimensions = dc.getTextDimensions(secondaryIcon, iconoFont);

        var width = hrIconDimensions[0] + hrTextDimensions[0] + secondaryIconDimensions[0] + secondaryTextDimensions[0] + 12;

        var hrIconStart = (x - width) / 2.3; // ancho inicio icono corazon
        dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
        dc.drawText(hrIconStart, y, iconoFont, hrIcon, Graphics.TEXT_JUSTIFY_LEFT);

        var hrTextStart = hrIconStart + hrIconDimensions[0] + 4; //espacios entre icono y texto
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(hrTextStart, y, textoFont, hrText, Graphics.TEXT_JUSTIFY_LEFT);

        var secondaryIconStart = hrTextStart + hrTextDimensions[0] + 4;//espacios entre icono y texto
        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(secondaryIconStart, y, iconoFont, secondaryIcon, Graphics.TEXT_JUSTIFY_LEFT);

        var secondaryTextStart = secondaryIconStart + secondaryIconDimensions[0] + 4; //espacios entre icono y texto
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(secondaryTextStart, y, textoFont, secondaryText, Graphics.TEXT_JUSTIFY_LEFT);
    }
}
