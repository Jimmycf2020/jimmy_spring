<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Jimmy Cruz</title>
</head>
<body> 

 <div class="container">
 <h1>Crud de Trabajador</h1>
		 <div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudTrabajador">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaCrudTrabajador" class="simple_form" id="defaultForm2"  method="post">
					<div class="row">
						<div class="col-md-3">	
							<div class="form-group">
							  	<label class="control-label" for="id_nonbre_filtro">NOMBRE</label>
							  	<input class="form-control" id="id_nonbre_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
							</div>
						</div>
					</div>			
					<div class="row">
						<div class="col-md-3">
							<button type="submit" class="btn btn-primary" id="validateBtnw1" >FILTRA</button><br>&nbsp;<br>
						</div>
						<div class="col-md-3">
							<button type="button" data-toggle='modal' onclick="registrar();"  class='btn btn-success' id="validateBtnw2" >REGISTRA</button><br>&nbsp;<br>
						</div>
					</div>
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="tableAlumno" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>Nombre</th>
												<th>Dni</th>
												<th>Año de ingreso</th>
												<th>Sueldo</th>
												<th>Año de salida</th>
												<th>Categoria</th>
												<th>Actualiza</th>
												<th>Elimina</th>
											</tr>
										</thead>
										<tbody>
												   
												<c:forEach items="${modalidades}" var="x">
													<tr>
														<td>${x.idModalidad}</td>
														<td>${x.nombre}</td>
														<td>${x.numHombres}</td>
														<td>${x.numMujeres}</td>
														<td>${x.edadMaxima}</td>
														<td>${x.edadMinima}</td>
														<td>${x.deporte.nombre}</td>
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idModalidad}','${x.nombre}','${x.numHombres}','${x.numMujeres}','${x.edadMaxima}','${x.edadMinima}','${x.deporte.idDeporte}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' id='id_update' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idModalidad}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/delete.gif' width='auto' height='auto' />
															</button>
														</td>
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 		</form>
		  </div>
  
  	 <div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de trabajador</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudTrabajador" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del trabajador</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_num_hombres">Dni</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_num_hombres" name="numHombres" placeholder="Ingrese el dni" type="text" maxlength="8"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_num_mujeres">Año de ingreso</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_num_mujeres" name="numMujeres" placeholder="Ingrese el año de ingreso" type="text" maxlength="4"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_maxima">Sueldo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_maxima" name="edadMaxima" placeholder="Ingrese el sueldo" type="text" maxlength="8"/>
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_minima">Año de salida</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_minima" name="edadMinima" placeholder="Ingrese el año de salida" type="text" maxlength="4"/>
		                                        </div>
		                                    </div>    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_deporte">Categoria</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_deporte" name="deporte.idDeporte" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">REGISTRA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
  
		 <div class="modal fade" id="idModalActualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Trabajador</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraActualizaCrudTrabajador" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del trabajador</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idModalidad" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_num_hombres">Dni</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_num_hombres" name="numHombres" placeholder="Ingrese el dni" type="text" maxlength="8"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_num_mujeres">Año de ingreso</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_num_mujeres" name="numMujeres" placeholder="Ingrese el año de ingreso" type="text" maxlength="4"/>
		                                        </div>
		                                    </div>		   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_maxima">Sueldo</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_maxima" name="edadMaxima" placeholder="Ingrese el sueldo" type="text" maxlength="8"/>
		                                        </div>
		                                    </div>   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_minima">Año de salida</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_minima" name="edadMinima" placeholder="Ingrese el año de salida" type="text" maxlength="4"/>
		                                        </div>
		                                    </div>    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_deporte">Categoria</label>
		                                        <div class="col-lg-5">
													<select id="id_act_deporte" name="deporte.idDeporte" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">ACTUALIZA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        </div>

		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>

</div>

<script type="text/javascript">
$.getJSON("cargaDeporte", {}, function(data, q,t){
	console.log(data);
	
	$.each(data, function(index,item){
		$("#id_reg_deporte").append("<option value="+item.idDeporte +">"+ item.nombre +"</option>");
		$("#id_act_deporte").append("<option value="+item.idDeporte +">"+ item.nombre +"</option>");
	});
	
});
</script>

<script type="text/javascript">
function eliminar(id){	
	$('input[id=id_elimina]').val(id);
	$('#idFormElimina').submit();
}

function registrar(){	
	$('#idModalRegistra').modal("show");
}

function editar(id,nombre,numHombres,numMujeres,edadMaxima, edadMinima, idDeporte){	
	$('input[id=id_ID]').val(id);
	$('input[id=id_act_nombre]').val(nombre);
	$('input[id=id_act_num_hombres]').val(numHombres);
	$('input[id=id_act_num_mujeres]').val(numMujeres);
	$('input[id=id_act_minima]').val(edadMinima);
	$('input[id=id_act_maxima]').val(edadMaxima);
	$('select[id=id_act_deporte]').val(idDeporte);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tableAlumno').DataTable();
} );
</script>

<script type="text/javascript">
	$('#id_form_registra').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"nombre": {
        		selector : '#id_reg_nombre',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },

                }
            },
            "numHombres": {
        		selector : '#id_reg_num_hombres',
                validators: {
                    notEmpty: {
                        message: 'El dni es un campo obligatorio'
                    },

                }
            },
            "numMujeres": {
        		selector : '#id_reg_num_mujeres',
                validators: {
                	notEmpty: {
                        message: 'El año de ingreso es un campo obligatorio'
                    },

                }
            },
            "edadMaxima": {
        		selector : '#id_reg_maxima',
                validators: {
                	notEmpty: {
                        message: 'La sueldo es un campo obligatorio'
                    },

                }
            },
            "edadMinima": {
        		selector : '#id_reg_minima',
                validators: {
                	notEmpty: {
                        message: 'La año de salida es un campo obligatorio'
                    },

                }
            },
            "deporte.idDeporte": {
        		selector : '#id_reg_deporte',
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
	$('#id_form_actualiza').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	"nombre": {
        		selector : '#id_act_nombre',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },

                }
            },
            "numHombres": {
        		selector : '#id_act_num_hombres',
                validators: {
                    notEmpty: {
                        message: 'El dni es un campo obligatorio'
                    },

                }
            },
            "numMujeres": {
        		selector : '#id_act_num_mujeres',
                validators: {
                	notEmpty: {
                        message: 'El año de ingreso es un campo obligatorio'
                    },

                }
            },
            "edadMaxima": {
        		selector : '#id_act_maxima',
                validators: {
                	notEmpty: {
                        message: 'La sueldo es un campo obligatorio'
                    },

                }
            },
            "edadMinima": {
        		selector : '#id_act_minima',
                validators: {
                	notEmpty: {
                        message: 'El año de salida es un campo obligatorio'
                    },

                }
            },
            "deporte.idDeporte": {
        		selector : '#id_act_deporte',
                validators: {
                	notEmpty: {
                        message: 'La categoria es un campo obligatorio'
                    },
                }
            },
          
        }   
    });
</script>
    
</body>
</html> 