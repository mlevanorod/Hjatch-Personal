$(document).ready(function(){
	$(document).delegate("#nombredelboton","click",function(){
		$( "#nombredeldiv" ).load( "lapagina.html" );
	})
})