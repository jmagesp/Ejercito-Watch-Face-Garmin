using Toybox.System;
using Toybox.WatchUi;

class bateria extends WatchUi.Drawable {

    function initialize(options) {
        Drawable.initialize(options);
    }

    function draw(dc) {
        var bateria = System.getSystemStats().battery;
        //datos x-y para inicio y dibujo
        var width = 32;
        var height = 20;
        var xStart = (dc.getWidth() - width) / 2;
        var yStart = (dc.getHeight() - height);
        
        // Dibujo bateria
        dc.setPenWidth(1);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawRectangle(xStart, yStart, width, height);

        var xKnob = xStart + 32 + 1;
        dc.drawLine(xKnob, yStart + 4, xKnob, yStart + 12);

        // Porcentaje bateria
        if (bateria >= 70) {
            dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_TRANSPARENT);
        } else if (bateria >= 50) {
            dc.setColor(Graphics.COLOR_YELLOW, Graphics.COLOR_TRANSPARENT);
        }  else if (bateria >= 30) {
            dc.setColor(Graphics.COLOR_ORANGE, Graphics.COLOR_TRANSPARENT);
        } else {
            dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
        }
        dc.fillRectangle(xStart + 1, yStart + 1, (width - 2) * bateria / 100, height - 2);
        var myBateria;
        var bateriaFont = WatchUi.loadResource(Rez.Fonts.numeros2);
        myBateria = new WatchUi.Text({
            :text=>bateria.format("%d"),
            :color=>Graphics.COLOR_WHITE,
            :font=>bateriaFont,
            :justification=>Graphics.TEXT_JUSTIFY_CENTER,
            :locX =>xStart+15,
            :locY=>yStart-1
        });
        myBateria.draw(dc);
    }
}
