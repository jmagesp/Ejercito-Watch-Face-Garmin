using Toybox.WatchUi as Ui;
using Toybox.System;
using Toybox.Time;
using Toybox.Time.Gregorian;
using Toybox.Graphics;
using Toybox.ActivityMonitor as AttMon;
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
        //fecha
        var date = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
		var systemStats = System.getSystemStats(); 
        View.findDrawableById("Date").setText(date.day.format("%02d") + "/" + date.month);

        View.onUpdate(dc);
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
            datos240_240(dc);
            texto240_240(dc);
        }
        if (ancho == 260 && alto == 260){            
            empleo260_260(dc); 
            datos260_260(dc);
            texto260_260(dc);           
        }
        if (ancho == 416 && alto == 416){
            empleo416_416(dc); 
            datos416_416(dc);
            texto416_416(dc);
        }
        if (ancho == 390 && alto == 390){
            empleo390_390(dc); 
            datos390_390(dc);
            texto390_390(dc);
        }
        if (ancho == 360 && alto == 360){
            empleo360_360(dc); 
            datos360_360(dc);
            texto360_360(dc);
        }
        if (ancho == 320 && alto == 360){
            empleo320_360(dc); 
            datos320_360(dc);
            texto320_360(dc);
        }
        if (ancho == 280 && alto == 280){
            empleo280_280(dc); 
            datos280_280(dc);
            texto280_280(dc);
        }
        if (ancho == 218 && alto == 218){
            empleo218_218(dc); 
            datos218_218(dc);
            texto218_218(dc);
        }
        if (ancho == 215 && alto == 180){
            empleo215_180(dc); 
            datos215_180(dc);
            texto215_180(dc);
        }
        if (ancho == 208 && alto == 208){            
            empleo208_208(dc); 
            datos208_208(dc);
            texto208_208(dc);
        }        
    }
}