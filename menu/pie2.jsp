	</div> <!-- / #content-wrapper -->
	<div id="main-menu-bg"></div>
</div> <!-- / #main-wrapper -->

<!-- Get jQuery from Google CDN -->
<!--[if !IE]> -->
	<script type="text/javascript"> window.jQuery || document.write('<script src="../js/jquery.min.js">'+"<"+"/script>"); </script>
<!-- <![endif]-->
<!--[if lte IE 9]>
	<script type="text/javascript"> window.jQuery || document.write('<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js">'+"<"+"/script>"); </script>
<![endif]-->


<!-- Pixel Admin's javascripts -->
<script src="../assets/javascripts/bootstrap.min.js"></script>
<script src="../assets/javascripts/pixel-admin.min.js"></script>


<script type="text/javascript">
	init.push(function () {
		//Javascript code here
		$('#main-menu, #main-navbar').on('touchend', 'a', function(){
			$(this).trigger('click');
			return false;
		});
		$('#main-menu, #main-navbar').on('touchend', 'button', function(){
			$(this).trigger('click');
			return false;
		});

		$('#cambio_clave').on('click', function () {
			bootbox.prompt({
				title: "Ingrese la clave nueva: ",
				callback: function(result) {
					if (result === null) {
						alert("Su clave no fue cambiada!!!");
					} else {

						$.post('../menu/cambio_clave.jsp?f_usuario='+<%=id_personal%>+'&f_clave='+result ,function(data){
                    		if (data==1) {
                    			alert("La clave Nueva es: " + result );
                    		}else{
                    			alert("CLAVE ERRONEA!!!" );
                    		}
                		});
						
					}
				},
				className: "bootbox-sm"
			});
		});
		
	})
	window.PixelAdmin.start(init);
</script>

</body>
</html>
<%@ include file= "../cierradb.jsp" %> 
<%@ include file= "../cierradb2.jsp" %> 
<%@ include file= "../cierradb3.jsp" %> 