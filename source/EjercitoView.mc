using Toybox.WatchUi as Ui;
using Toybox.System;
using Toybox.Graphics;
using Toybox.Application;

class EjercitoView extends Ui.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }
    function onLayout(dc) {
        setLayout(Rez.Layouts.ejercitoLayout(dc));
    }
    function onShow() {  }

    function onUpdate(dc) { 

        View.onUpdate(dc);
        //dibujamos circulo esfera
        var screenAncho = dc.getWidth();
        var screenAlto = dc.getHeight();
        var centroX = screenAncho / 2;
        var centroY = screenAlto / 2;
        var color = dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
        //cambia calor cada 5 segundos
        var time = System.getClockTime();
        if (time.sec % 5 == 0) {
            color;
        }else {
            color = dc.setColor(Graphics.COLOR_YELLOW, Graphics.COLOR_TRANSPARENT);
        }
        dc.setPenWidth(2);
        dc.drawCircle(centroX, centroY, centroX);
        //detecta tamaño esfera y dibuja empleo
        esfera(dc);        
    }

    function onHide() { }

    function onExitSleep() { }
    
    function onEnterSleep() { }    

    function esfera(dc) {
        var esfera = System.getDeviceSettings();
        var ancho = esfera.screenWidth;
        var alto = esfera.screenHeight;

        if (ancho == 240 && alto == 240){
            empleo240_240(dc); 
            texto240_240(dc);
        }
        if (ancho == 260 && alto == 260){            
            empleo260_260(dc); 
            texto260_260(dc);           
        }
        if (ancho == 416 && alto == 416){
            empleo416_416(dc); 
            texto416_416(dc);
        }
        if (ancho == 390 && alto == 390){
            empleo390_390(dc); 
            texto390_390(dc);
        }
        if (ancho == 360 && alto == 360){
            empleo360_360(dc); 
            texto360_360(dc);
        }
        if (ancho == 320 && alto == 360){
            empleo320_360(dc); 
            texto320_360(dc);
        }
        if (ancho == 280 && alto == 280){
            empleo280_280(dc); 
            texto280_280(dc);
        }
        if (ancho == 218 && alto == 218){
            empleo218_218(dc); 
            texto218_218(dc);
        }
        if (ancho == 215 && alto == 180){
            empleo215_180(dc); 
            texto215_180(dc);
        }
        if (ancho == 208 && alto == 208){            
            empleo208_208(dc); 
            texto208_208(dc);
        }        
    }
}