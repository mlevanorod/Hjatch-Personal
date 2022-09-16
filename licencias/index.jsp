<%@ include file="../menu/cabecera2.jsp"%>

<div id="app">
	<h1> {{ message }} </h1>
	<ul>
		<li v-for="language in languages">
			{{ language }}
		</li>
	</ul>
	<h3>{{ numero1 }} + {{ numero2 }} = {{ suma() }} </h3>
	<h3>{{ numero1 }} - {{ numero2 }} = {{ resta() }} </h3>
	<h3>{{ numero1 }} / {{ numero2 }} = {{ divi() }} </h3>
	<h3>{{ numero1 }} * {{ numero2 }} = {{ multi() }} </h3>
	
	<input type="number" v-model="numero1">
	<input type="number" v-model="numero2">
	<hr>
	
	<ul>
		<li>
			{{ language }}
		</li>
	</ul>
</div>

<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>

<script >
	new Vue({
		el: '#app',
		data: {
			message:" Funciona Vue",
			languages: ["Michael","Kenny","Dayho","Zamid","Jesus","Jasmin"],
			numero1: 0,
			numero2: 0,
		},
		methods:{
			suma:function(){
				return this.numero1 - (-this.numero2)
			},
			resta:function(){
				return this.numero1 - (this.numero2)
			},
			multi:function(){
				return this.numero1 * (this.numero2)
			},
			divi:function(){
				return this.numero1 / (this.numero2)
			}
		}
	})
</script>



	<!-- /7. $BOOTSTRAP_DATEPICKER -->
    <div class="row">
      <form id="unidad_organica" name="unidad_organica">
        <div class="col-md-6 col-md-offset-3">
            <div class="table-primary">
                <div align="center"  class="table-header">
                    <div class="table-caption">
                        ASIGNAR PERSONAL - UNIDAD ORGANICA
                    </div>
                </div>

                <div class="panel-body">

						<div align="left" class="input-daterange input-group" id="bs-datepicker-range"> 
                        <span class="input-group-addon">
           					PERSONAL :  
                        </span>
                        <input class="input-sm form-control" type="text" name="f_personal" id="f_personal"  >
          			</div>  


		            <div class="input-group">
		                <div class="input-group date" id="bs-datepicker-component">
		                    <input type="text" class="form-control"><span class="input-group-addon"><i class="fa fa-calendar"></i></span>
		                </div>
		            </div>

		            <div class="input-group">
		                <div class="input-group date" id="bs-datepicker-component">
		                    <input type="text" class="form-control"><span class="input-group-addon"><i class="fa fa-calendar"></i></span>
		                </div>
		            </div>

                    <div class="form-group">
                        <div align="center" class="col-sm-offset-1 col-sm-9">

                          <button type="submit" id="enviar_upd" class="btn btn-primary" >Guardar</button>&nbsp;&nbsp;
                          <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>

                        </div>
                    </div>
      			</div>

            </div>
        </div>
      </form>
    </div>

<%@ include file="../menu/pie2.jsp"%>