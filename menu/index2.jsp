<%@ include file="cabecera.jsp"%>
<!-- 5. $CONTENT ===================================================================================

        Content
-->


		<!-- Javascript -->
		<script>
			init.push(function () {
				var $ph  = $('.page-pricing-header'),
				    $img = $ph.find('> img');

				$(window).on('resize', function () {
					$img.attr('style', '');
					if ($img.height() < $ph.height()) {
						$img.css({
							height: '100%',
							width: 'auto'
						});
					}
				});
			})
		</script>
		<!-- / Javascript -->

		<div class="page-pricing-header">
		  <p><img src="../assets/demo/pricing-bg.jpg" alt=""></p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<table width="994" border="0" class="bounceInLeft">
			  <tr>
			    <td width="6" bgcolor="#CCCCCC">&nbsp;</td>
			    <td width="949" bgcolor="#CCCCCC">&nbsp;</td>
			    <td width="25" bgcolor="#CCCCCC">&nbsp;</td>
		      </tr>
			  <tr>
			    <td bgcolor="#CCCCCC">&nbsp;</td>
			    <td align="center"><p><img src="instrucciones_rol_guardias.jpg" width="720" height="520"></p></td>
			    <td bgcolor="#CCCCCC">&nbsp;</td>
		      </tr>
			  <tr>
			    <td bgcolor="#CCCCCC">&nbsp;</td>
			    <td bgcolor="#CCCCCC">&nbsp;</td>
			    <td bgcolor="#CCCCCC">&nbsp;</td>
		      </tr>
		  </table>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp; </p>
<div class="bg-overlay" style="background: #8f7c5f;"></div>
			<div class="page-pricing-header-content">
				
			</div>
		</div>
	

<%@ include file="pie.jsp"%>
