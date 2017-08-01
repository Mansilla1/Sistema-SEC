		$(document).ready(function(){
		
		$("#log").submit(function(){
			
			 $.ajax({
                type:"post",
                dataType:"json",
                url:"controlador/Login_controlador.php",
                data:$(this).serialize(),
                beforeSend : function() {
						$("#logButton").attr("disabled", true);
						$("#logButton").html("<img src='img/loaders/1.gif' /> &nbsp; Iniciando ...");
						
					},
					success : function(data) {
         					
							$("#logButton").attr("disabled", true);		
							if(data.respuesta == 1){
								localStorage.setItem("nombreUsuario", data.nombreUsuario);
								localStorage.setItem("tipoUsuario", data.tipoCuenta);
								switch (data.code) {
									case 1:
								 setTimeout(' window.location.href = "http://proyectosdetitulo.cl/evaluacion/director_administrador/inicio.php"; ',500);
									break;
									case 2:
								 setTimeout(' window.location.href = "http://proyectosdetitulo.cl/evaluacion/profesor/inicio.php"; ',500);
									break;
									case 3:
								 setTimeout(' window.location.href = "http://proyectosdetitulo.cl/evaluacion/alumno/inicio.php"; ',500);
									break;

								}
						 	}else {
								 $("#logButton").attr("disabled", false);
								 $("#logButton").html("Reintente");
									$("#mensaje").html(data.respuesta);
							 }
						
						
					},
					error : function(data) {
						$("#logButton").attr("disabled", false);
						$("#logButton").html("Reintente");
					}
         });
		 return false;
		});
	});	