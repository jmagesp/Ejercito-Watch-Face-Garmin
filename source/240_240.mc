using Toybox.WatchUi as Ui;
using Toybox.System;
using Toybox.Time;
using Toybox.Time.Gregorian;
using Toybox.Graphics;
using Toybox.ActivityMonitor as AttMon;
using Toybox.Application;
using Toybox.Lang as Lang;

function datos240_240(dc) {
        //pasos
        var DibujoPasos = Ui.loadResource(Rez.Drawables.pasos); 
        dc.drawBitmap(90, 20, DibujoPasos);
        //bateria
        var bateria = System.getSystemStats().battery;
        //dibujo bateria   
        var DibujoBateria;      
        if (bateria <= 100) { 
            DibujoBateria = Ui.loadResource(Rez.Drawables.BatVerde); 
            dc.drawBitmap(100, 208, DibujoBateria); 
        }
        if (bateria <= 75) {  
            DibujoBateria = Ui.loadResource(Rez.Drawables.BatNaranja); 
            dc.drawBitmap(100, 208, DibujoBateria);
        }
        if (bateria <= 50) { 
            DibujoBateria = Ui.loadResource(Rez.Drawables.BatNaranja2); 
            dc.drawBitmap(100, 208, DibujoBateria); 
        }
        if (bateria <= 25) { 
            DibujoBateria = Ui.loadResource(Rez.Drawables.BatAmarilla); 
            dc.drawBitmap(100, 208, DibujoBateria); 
        }
        if (bateria <= 15) { 
            DibujoBateria = Ui.loadResource(Rez.Drawables.BatRoja); 
            dc.drawBitmap(100, 208, DibujoBateria); 
        }
        //porcentaje bateria
        var myBateria;
        var bateriaFont = Ui.loadResource(Rez.Fonts.bateriaFont);
        myBateria = new Ui.Text({
            :text=>bateria.format("%d"),
            :color=>Graphics.COLOR_WHITE,
            :font=>bateriaFont,
            :justification=>Graphics.TEXT_JUSTIFY_CENTER,
            :locX =>115,
            :locY=>208
        });
        myBateria.draw(dc);
    }

    function empleo240_240(dc) {        
        //Seleccion empleo
        var SetEmpleo = Application.getApp().getProperty("Empleos"); 
        //var SetEmpleo = 8;
        var DibujoEmpleo;
        if (SetEmpleo < 0 || SetEmpleo > 15){
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.NoEmpleo); //null + error controlado
            dc.drawBitmap(45, 160, DibujoEmpleo);
        }
        if (SetEmpleo == 0) { 
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.NoEmpleo); //sin empleo +
            dc.drawBitmap(45, 160, DibujoEmpleo);
        } 
        if (SetEmpleo == 1) {
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Cor); //coronel +
            dc.drawBitmap(45, 160, DibujoEmpleo);
        }
        if (SetEmpleo == 2) { 
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Tcol); //teniente coronel +
            dc.drawBitmap(45, 160, DibujoEmpleo);
        } 
        if (SetEmpleo == 3) {
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Cte); //comandante +
            dc.drawBitmap(65, 160, DibujoEmpleo);
        }
        if (SetEmpleo == 4) { 
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Cap); //capitan +
            dc.drawBitmap(50, 160, DibujoEmpleo);
        } 
        if (SetEmpleo == 5) {
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Tte); //teniente +
            dc.drawBitmap(55, 160, DibujoEmpleo);
        }
        if (SetEmpleo == 6) { 
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Alf); //alferez *
            dc.drawBitmap(60, 160, DibujoEmpleo);
        } 
        if (SetEmpleo == 7) {
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Sbmy); //sbmy +
            dc.drawBitmap(60, 155, DibujoEmpleo);
        }
        if (SetEmpleo == 8) { 
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Sbtte); // sbtte +
            dc.drawBitmap(55, 155, DibujoEmpleo);
        } 
        if (SetEmpleo == 9) {
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Bda); //bda +
            dc.drawBitmap(60, 160, DibujoEmpleo);
        }
        if (SetEmpleo == 10) { 
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Sgto1); //sgto1 +
            dc.drawBitmap(60, 160, DibujoEmpleo);
        } 
        if (SetEmpleo == 11) {
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Sgto); //sgto +
            dc.drawBitmap(50, 170, DibujoEmpleo);
        }
        if (SetEmpleo == 12) { 
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Cbmy); //cbmy +
            dc.drawBitmap(60, 160, DibujoEmpleo);
        } 
        if (SetEmpleo == 13) {
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Cb1); //cb1 +
            dc.drawBitmap(60, 170, DibujoEmpleo);
        }
        if (SetEmpleo == 14) { 
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Cb); //cb +
            dc.drawBitmap(60, 160, DibujoEmpleo);
        } 
        if (SetEmpleo == 15) {
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Sdo); //sdo +
            dc.drawBitmap(55, 170, DibujoEmpleo);
        }
    }
    function texto240_240(dc) {    
        var myText;
        var nombre = Application.getApp().getProperty("Nombre");
        //var nombre ="Fernandez";
        myText = new Ui.Text({
            :text=>nombre,
            :color=>Graphics.COLOR_WHITE,
            :font=>Graphics.FONT_SMALL,
            :justification=>Graphics.TEXT_JUSTIFY_CENTER,
            :locX =>175,
            :locY=>160
        });
        myText.draw(dc);
    }
    function Reloj240_240(dc)
    {
        var ancho1  = (dc.getWidth()/2);
        var alto1  = (dc.getHeight()/2)-55;
        var reloj = System.getClockTime();
        var numerosFont =  Ui.loadResource(Rez.Fonts.numerosFont); 
        var color = (Application.getApp().getProperty("ColorHora") as Number);    
        dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.drawText(ancho1, alto1, numerosFont, Lang.format("$1$:$2$", [reloj.hour.format("%02d"),reloj.min.format("%02d")]), Graphics.TEXT_JUSTIFY_CENTER);
    }
    function dibujoCorazon240_240(dc)
    {
        var SensorLatidos = Application.getApp().getProperty("SensorLatidos");
        var corazonFont = null;
        //var SensorLatidos = true;
        if (SensorLatidos == true) {        
            corazonFont =  Ui.loadResource(Rez.Fonts.corazon90Font);        
            dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
            dc.drawText(125, 10, corazonFont, "y", Graphics.TEXT_JUSTIFY_LEFT); //la y - codigo ascii de fnt
        } 
        if (SensorLatidos == false) {
            corazonFont = null;
        }
    }