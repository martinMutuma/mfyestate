 var map;
 var geocoder = null; 
 var marker; 
function load() {
	if(document.getElementById("mapX"))
		showMap('map',$("#mapX").val(),$("#mapY").val());
	else
		defaultLoad();
}

function defaultLoad(){
	if (GBrowserIsCompatible()) {
		map = new GMap2(document.getElementById("map"));
		var center = new GLatLng(32.048461, 118.801775);
		map.setCenter(center, 13);
		marker = new GMarker(center, {
					draggable : false  //是否可拖动图标
				});
		GEvent.addListener(map, 'click', function(overlay, point) {
			if (overlay) {
				// nothing
			} else {
				// 清除以前所点击图标
				map.clearOverlays();
				document.getElementById('jing').value = +point.x;
				document.getElementById('wei').value = point.y;
				var marker = map.addOverlay(new GMarker(point));
			}
		});
		var customUI = map.getDefaultUI();
        // Remove MapType.G_HYBRID_MAP
        customUI.maptypes.hybrid = false;
      	customUI.controls.scalecontrol = false;
        map.setUI(customUI);
		map.addOverlay(marker);
		geocoder = new GClientGeocoder(); 
	}
}

function showMap(id,jing,wei) {
	if (GBrowserIsCompatible()) {
		map = new GMap2(document.getElementById(id));
		var center = new GLatLng(jing, wei);
		map.setCenter(center, 13);
		marker = new GMarker(center, {
					draggable : false  //是否可拖动图标
				});
		var customUI = map.getDefaultUI();
        customUI.maptypes.hybrid = false;
      	customUI.controls.scalecontrol = false;
        map.setUI(customUI);
		map.addOverlay(marker);
		geocoder = new GClientGeocoder(); 
	}

}

function createMarker(point,title,html)  
{ 
    var marker = new GMarker(point); 
    GEvent.addListener(marker, "click", function()  
    { 
        marker.openInfoWindowHtml( 
            '<div style="width:250px" align="left">'+html+'</div>', 
            { 
                maxContent: '<div style="width:100%" align="left">'+html+'</div>', 
                maxTitle: title} 
            ); 
    }); 
    return marker; 
} 

function goAddress(){
	var addressText = $("#addressText").val();
	if (geocoder)  
	{ 
	    geocoder.getLatLng( 
	        addressText, 
	        function(point)  
	        { 
	            if (!point)  
	            { 
	                alert(addressText+"没有找到"); 
	            }  
	            else  
	            { 
	                if(marker)   //移除上一個點 
	                { 
	                    map.removeOverlay(marker); 
	                } 
	                map.setCenter(point, 13); 
	                var title = "地位地址"; 
	                marker = createMarker(point,title,addressText); 
	                map.addOverlay(marker); 
	                marker.openInfoWindowHtml( 
	                    '<div style="width:250px" align="left">'+addressText+'</div>', 
	                    { 
	                        maxContent: '<div style="width:100%" align="left">'+addressText+'</div>', 
	                        maxTitle: title} 
	                    ); 
	            } 
	        } 
	    ); 
	} 
}
