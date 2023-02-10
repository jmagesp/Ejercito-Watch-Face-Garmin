using Toybox.WatchUi as Ui;
using Toybox.System;
using Toybox.Time;
using Toybox.Time.Gregorian;
using Toybox.Graphics;
using Toybox.ActivityMonitor as AttMon;
using Toybox.Application;
using Toybox.Lang as Lang;

function datos416_416(dc) {
        //bateria
        var bateria = System.getSystemStats().battery;
        //dibujo bateria  
        var DibujoBateria;      
        if (bateria <= 100) { 
            DibujoBateria = Ui.loadResource(Rez.Drawables.BatVerde); 
            dc.drawBitmap(190, 350, DibujoBateria); 
        }
        if (bateria <= 75) {  
            DibujoBateria = Ui.loadResource(Rez.Drawables.BatNaranja); 
            dc.drawBitmap(190, 350, DibujoBateria);
        }
        if (bateria <= 50) { 
            DibujoBateria = Ui.loadResource(Rez.Drawables.BatNaranja2); 
            dc.drawBitmap(190, 350, DibujoBateria); 
        }
        if (bateria <= 25) { 
            DibujoBateria = Ui.loadResource(Rez.Drawables.BatAmarilla); 
            dc.drawBitmap(190, 350, DibujoBateria); 
        }
        if (bateria <= 15) { 
            DibujoBateria = Ui.loadResource(Rez.Drawables.BatRoja); 
            dc.drawBitmap(190, 350, DibujoBateria); 
        }
        //porcentaje bateria
        var myBateria;
        var bateriaFont = Ui.loadResource(Rez.Fonts.bateriaFont);
        myBateria = new Ui.Text({
            :text=>bateria.format("%d"),
            :color=>Graphics.COLOR_WHITE,
            :font=>bateriaFont,
            :justification=>Graphics.TEXT_JUSTIFY_CENTER,
            :locX =>205,
            :locY=>350
        });
        myBateria.draw(dc);
    }

    function empleo416_416(dc) {        
        //Seleccion empleo
        var SetEmpleo = Application.getApp().getProperty("Empleos"); 
        //var SetEmpleo = 1;
        var DibujoEmpleo;
        if (SetEmpleo < 0 || SetEmpleo > 15){
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.NoEmpleo); //null + error controlado
            dc.drawBitmap(90, 270, DibujoEmpleo);
        }
        if (SetEmpleo == 0) { 
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.NoEmpleo); //sin empleo +
            dc.drawBitmap(90, 270, DibujoEmpleo);
        } 
        if (SetEmpleo == 1) {
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Cor); //coronel +
            dc.drawBitmap(90, 270, DibujoEmpleo);
        }
        if (SetEmpleo == 2) { 
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Tcol); //teniente coronel +
            dc.drawBitmap(110, 270, DibujoEmpleo);
        } 
        if (SetEmpleo == 3) {
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Cte); //comandante +
            dc.drawBitmap(90, 270, DibujoEmpleo);
        }
        if (SetEmpleo == 4) { 
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Cap); //capitan +
            dc.drawBitmap(90, 270, DibujoEmpleo);
        } 
        if (SetEmpleo == 5) {
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Tte); //teniente +
            dc.drawBitmap(90, 270, DibujoEmpleo);
        }
        if (SetEmpleo == 6) { 
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Alf); //alferez *
            dc.drawBitmap(110, 270, DibujoEmpleo);
        } 
        if (SetEmpleo == 7) {
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Sbmy); //sbmy +
            dc.drawBitmap(90, 270, DibujoEmpleo);
        }
        if (SetEmpleo == 8) { 
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Sbtte); // sbtte +
            dc.drawBitmap(90, 270, DibujoEmpleo);
        } 
        if (SetEmpleo == 9) {
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Bda); //bda +
            dc.drawBitmap(90, 270, DibujoEmpleo);
        }
        if (SetEmpleo == 10) { 
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Sgto1); //sgto1 +
            dc.drawBitmap(90, 270, DibujoEmpleo);
        } 
        if (SetEmpleo == 11) {
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Sgto); //sgto +
            dc.drawBitmap(90, 270, DibujoEmpleo);
        }
        if (SetEmpleo == 12) { 
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Cbmy); //cbmy +
            dc.drawBitmap(90, 270, DibujoEmpleo);
        } 
        if (SetEmpleo == 13) {
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Cb1); //cb1 +
            dc.drawBitmap(90, 290, DibujoEmpleo);
        }
        if (SetEmpleo == 14) { 
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Cb); //cb +
            dc.drawBitmap(90, 270, DibujoEmpleo);
        } 
        if (SetEmpleo == 15) {
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Sdo); //sdo +
            dc.drawBitmap(90, 290, DibujoEmpleo);
        }
    }
    function texto416_416(dc) {    
        var myText;
        var nombre = Application.getApp().getProperty("Nombre");
        //var nombre ="Fernandez";
        myText = new Ui.Text({
            :text=>nombre,
            :color=>Graphics.COLOR_WHITE,
            :font=>Graphics.FONT_SMALL,
            :justification=>Graphics.TEXT_JUSTIFY_CENTER,
            :locX =>280,
            :locY=>260
        });
        myText.draw(dc);
    }