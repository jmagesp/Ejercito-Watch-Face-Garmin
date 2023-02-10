using Toybox.Application;
using Toybox.Graphics;

class EjercitoApp extends Application.AppBase {
       
    function initialize() {
        AppBase.initialize();
    }
    
    function onStart(state) { }

    function onStop(state) { }

    function getInitialView() {
        return [ new EjercitoView() ];
    }
}