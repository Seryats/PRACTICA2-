<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Ejemplos de CIBERTEC - Jorge Jacinto </title>
</head>
<body>

<div class="container">
<h3>Registra Jugador</h3>
	
	<form  id="id_form" method="post"> 
	 <div class="col-md-12" style="margin-top: 2%">
			<div class="row">
				<div class="form-group col-md-6">
					<label class="control-label" for="id_nombre">Nombre</label>
					<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
				</div>
				<div class="form-group col-md-6">
					<label class="control-label" for="id_alias">Alias</label>
					<input class="form-control" type="text" id="id_alias" name="alias" placeholder="Ingrese el alias" >
				</div>
			
			</div>
			
		    <div class="row">
		    	<div class="form-group col-md-6">
					<label class="control-label" for="id_juego">Juego</label>
					<input class="form-control" type="text" id="id_juego" name="juego" placeholder="Ingrese el juego" >
				</div>
				<div class="form-group col-md-6">
					<label class="control-label" for="id_experiencia">Experiencia</label>
					<input class="form-control" type="text" id="id_experiencia" name="experiencia" placeholder="Ingrese la experiencia" >
				</div>
				
				
			<div class="form-group col-md-6">
					<label class="control-label" for="id_pais">Pais</label>
					<input class="form-control" type="text" id="id_pais" name="pais" placeholder="Ingrese el pais" >
				</div>
				
				
				<div class="form-group col-md-12" align="center">
					<button id="id_registrar" type="button" class="btn btn-primary" >Registra</button>
				</div>
			</div>
	</div>
	</form>
	
</div>

<script type="text/javascript">

$.getJSON("listaPais", {}, function(data){
	console.log(data);
	$.each(data, function(index,item){
		$("#id_pais").append("<option value="+item.idPais +">"+ item.nombre +"</option>");
	});
});

$("#id_registrar").click(function (){ 

	var validator = $('#id_form').data('bootstrapValidator');
	validator.validate();

	if (validator.isValid()){
		$.ajax({
			type: 'POST',  
			data: $("#id_form").serialize(),
			url: 'registraJugador',
			success: function(data){
				mostrarMensaje(data.MENSAJE);
				limpiar();
				validator.resetForm();
			},
			error: function(){
				mostrarMensaje(MSG_ERROR);
			}
		});
	}
});

function limpiar(){
	$("#id_nombre").val('');
	$("#id_alias").val('');
	$("#id_pais").val('');
	$("#id_juego").val('');
	$("#id_experiencia").val('');


}

$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	nombre: {
    		selector : '#id_nombre',
            validators: {
                notEmpty: {
                    message: 'El nombre es un campo obligatorio'
                },
                stringLength :{
                	message:'El nombre es de 5 a 100 caracteres',
                	min : 5,
                	max : 100
                },
                remote :{
                	delay   : 1000,
                	url     : 'buscaPorNombreJugador',
                	message : 'El nombre ya existe'
                }
                
            }
        },      
        alias: {
    		selector : '#id_alias',
            validators: {
                notEmpty: {
                    message: 'El alias es un campo obligatorio'
                },
                stringLength :{
                	message:'El alias es de 5 a 100 caracteres',
                	min : 5,
                	max : 100
                },
                remote :{
                	delay   : 1000,
                	url     : 'buscaPorAlias',
                	message : 'El alias ya existe'
                }
              
            }
        },
        experiencia:{
            selector: "#id_experiencia",
            validators:{
                notEmpty: {
                     message: 'La experiencia es obligatoria'
                },
                greaterThan: {
	                value: 1,
	                inclusive: true,
	                message: 'La edad es mayor a 1'
	            }
            }
        },
        juego:{
            selector: "#id_juego",
            validators:{
                notEmpty: {
                     message: 'El juego es obligatorio'
                },
                stringLength: {
                    min: 3,
                    max: 40,
                    message: 'El nombre es de 3 a 40 caracteres'
                }
            }
        },
       
        pais: {
    		selector : '#id_pais',
            validators: {
            	notEmpty: {
                    message: 'El pais es un campo obligatorio'
                },
            }
        },
    	
    }   
});
</script>


</body>
</html>




