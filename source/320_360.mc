using Toybox.WatchUi as Ui;
using Toybox.System;
using Toybox.Time;
using Toybox.Time.Gregorian;
using Toybox.Graphics;
using Toybox.ActivityMonitor as AttMon;
using Toybox.Application;
using Toybox.Lang as Lang;

function datos320_360(dc) {
        //bateria
        var bateria = System.getSystemStats().battery;
        //dibujo bateria  
        var DibujoBateria;      
        if (bateria <= 100) { 
            DibujoBateria = Ui.loadResource(Rez.Drawables.BatVerde); 
            dc.drawBitmap(140, 330, DibujoBateria); 
        }
        if (bateria <= 75) {  
            DibujoBateria = Ui.loadResource(Rez.Drawables.BatNaranja); 
            dc.drawBitmap(140, 330, DibujoBateria);
        }
        if (bateria <= 50) { 
            DibujoBateria = Ui.loadResource(Rez.Drawables.BatNaranja2); 
            dc.drawBitmap(140, 330, DibujoBateria); 
        }
        if (bateria <= 25) { 
            DibujoBateria = Ui.loadResource(Rez.Drawables.BatAmarilla); 
            dc.drawBitmap(140, 330, DibujoBateria); 
        }
        if (bateria <= 15) { 
            DibujoBateria = Ui.loadResource(Rez.Drawables.BatRoja); 
            dc.drawBitmap(140, 330, DibujoBateria); 
        }
        //porcentaje bateria
        var myBateria;
        var bateriaFont = Ui.loadResource(Rez.Fonts.bateriaFont);
        myBateria = new Ui.Text({
            :text=>bateria.format("%d"),
            :color=>Graphics.COLOR_WHITE,
            :font=>bateriaFont,
            :justification=>Graphics.TEXT_JUSTIFY_CENTER,
            :locX =>155,
            :locY=>330
        });
        myBateria.draw(dc);
    }

    function empleo320_360(dc) {        
        //Seleccion empleo
        var SetEmpleo = Application.getApp().getProperty("Empleos"); 
        //var SetEmpleo = 15;
        var DibujoEmpleo;
        if (SetEmpleo < 0 || SetEmpleo > 15){
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.NoEmpleo); //null + error controlado
            dc.drawBitmap(50, 260, DibujoEmpleo);
        }
        if (SetEmpleo == 0) { 
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.NoEmpleo); //sin empleo +
            dc.drawBitmap(50, 260, DibujoEmpleo);
        } 
        if (SetEmpleo == 1) {
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Cor); //coronel +
            dc.drawBitmap(50, 260, DibujoEmpleo);
        }
        if (SetEmpleo == 2) { 
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Tcol); //teniente coronel +
            dc.drawBitmap(50, 260, DibujoEmpleo);
        } 
        if (SetEmpleo == 3) {
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Cte); //comandante +
            dc.drawBitmap(50, 260, DibujoEmpleo);
        }
        if (SetEmpleo == 4) { 
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Cap); //capitan +
            dc.drawBitmap(50, 260, DibujoEmpleo);
        } 
        if (SetEmpleo == 5) {
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Tte); //teniente +
            dc.drawBitmap(50, 260, DibujoEmpleo);
        }
        if (SetEmpleo == 6) { 
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Alf); //alferez *
            dc.drawBitmap(50, 260, DibujoEmpleo);
        } 
        if (SetEmpleo == 7) {
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Sbmy); //sbmy +
            dc.drawBitmap(50, 260, DibujoEmpleo);
        }
        if (SetEmpleo == 8) { 
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Sbtte); // sbtte +
            dc.drawBitmap(50, 260, DibujoEmpleo);
        } 
        if (SetEmpleo == 9) {
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Bda); //bda +
            dc.drawBitmap(50, 260, DibujoEmpleo);
        }
        if (SetEmpleo == 10) { 
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Sgto1); //sgto1 +
            dc.drawBitmap(50, 260, DibujoEmpleo);
        } 
        if (SetEmpleo == 11) {
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Sgto); //sgto +
            dc.drawBitmap(50, 260, DibujoEmpleo);
        }
        if (SetEmpleo == 12) { 
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Cbmy); //cbmy +
            dc.drawBitmap(50, 260, DibujoEmpleo);
        } 
        if (SetEmpleo == 13) {
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Cb1); //cb1 +
            dc.drawBitmap(50, 260, DibujoEmpleo);
        }
        if (SetEmpleo == 14) { 
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Cb); //cb +
            dc.drawBitmap(50, 260, DibujoEmpleo);
        } 
        if (SetEmpleo == 15) {
            DibujoEmpleo = Ui.loadResource(Rez.Drawables.Sdo); //sdo +
            dc.drawBitmap(50, 260, DibujoEmpleo);
        }
    }
    function texto320_360(dc) {    
        var myText;
        var nombre = Application.getApp().getProperty("Nombre");
        //var nombre ="Fernandez";
        myText = new Ui.Text({
            :text=>nombre,
            :color=>Graphics.COLOR_WHITE,
            :font=>Graphics.FONT_SMALL,
            :justification=>Graphics.TEXT_JUSTIFY_CENTER,
            :locX =>230,
            :locY=>250
        });
        myText.draw(dc);
    }