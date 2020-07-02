<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Jimmy Cruz</title>
</head>
<body>

<div class="container">
<h1>Registra Trabajador</h1>

	<c:if test="${sessionScope.MENSAJE != null}">
		<div class="alert alert-success fade in" id="success-alert">
		 <a href="#" class="close" data-dismiss="alert">&times;</a>
		 <strong>${sessionScope.MENSAJE}</strong>
		</div>
	</c:if>
	<c:remove var="MENSAJE" />

	<form action="registraModalidad" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">	
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombre</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
			<div class="form-group">
				<label class="control-label" for="id_num_hombres">Dni</label>
				<input class="form-control" id="id_num_hombres" name="numHombres" placeholder="Ingrese el número de dni" type="text" maxlength="8"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_num_mujeres">Año de ingreso</label>
				<input class="form-control" id="id_num_mujeres" name="numMujeres" placeholder="Ingrese el año de ingreso" type="text" maxlength="4"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_maxima">Sueldo</label>
				<input class="form-control" id="id_maxima" name="edadMaxima" placeholder="Ingrese el sueldo" type="text" maxlength="8"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_minima">Año de salida</label>
				<input class="form-control" id="id_minima" name="edadMinima" placeholder="Ingrese el año de salida" type="text" maxlength="4"/>
			</div>
			<div class="form-group">
				<label class="control-label" for="id_deporte">Categoria</label>
				<select id="id_deporte" name="deporte.idDeporte" class='form-control'>
					<option value=" ">[Seleccione]</option>    
				</select>
		    </div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >Crea Libro</button>
			</div>
	</form>
</div>

<script type="text/javascript">
$.getJSON("cargaDeporte", {}, function(data){
	$.each(data, function(index,item){
		$("#id_deporte").append("<option value="+item.idDeporte +">"+ item.nombre +"</option>");
	});
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">

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
                }
            }
        },
        numHombres: {
    		selector : '#id_num_hombres',
            validators: {
                notEmpty: {
                    message: 'El dni es un campo obligatorio'
                },

            }
        },
        numMujeres: {
    		selector : '#id_num_mujeres',
            validators: {
            	notEmpty: {
                    message: 'El año de ingreso es un campo obligatorio'
                },

            }
        },
        edadMaxima: {
    		selector : '#id_maxima',
            validators: {
            	notEmpty: {
                    message: 'El sueldo es un campo obligatorio'
                },

            }
        },
        edadMinima: {
    		selector : '#id_minima',
            validators: {
            	notEmpty: {
                    message: 'El año de salida es un campo obligatorio'
                },

            }
        },
        deporte: {
    		selector : '#id_deporte',
            validators: {
            	notEmpty: {
                    message: 'La categoria un campo obligatorio'
                },
            }
        },
    	
    }   
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

</body>
</html>




