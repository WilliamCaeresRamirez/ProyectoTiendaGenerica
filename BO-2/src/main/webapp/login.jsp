<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width">
	<title>repl.it</title>
	<link href="style.css" rel="stylesheet" type="text/css" />
	<!-- <title>Sofia Casta�eda</title> -->

	<!-- LLamando librerias y estilos de Bootstarp -->
	<link href="Style/login.css" rel="stylesheet" type="text/css" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	 crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	 crossorigin="anonymous">

	</script>
	


</head>
<!-- font awesome-->
<script src="https://kit.fontawesome.com/8e9e769e03.js" crossorigin="anonymous">

</script>


<body>

	<center>
	<br>
  <br>  
  <br>
  <br>
  <form class="formulario">
  <i class="fas fa-users fa-4x titulo"></i> 
  <h1 class="titulo">BIENVENIDOS </h1>
  <h1 class="titulo"> A SU TIENDA GEN�RICA </h1>
  <br>
  <div class="container">
  <br>
  <div class="menu">
  <i class="far fa-user titulo fa-2x"></i>
  <input  id = "inputuser" type="text" placeholder="Email">
  </div>
  <br>
  <div class="menu">
  <i class="fas fa-lock fa-2x titulo"></i>
  <input  id = "inputpass" type="password" placeholder="Password">
  
  </div></div>

<br>   
<br> 
  <button type="button" class="btn btn-warning" onclick="comparar()"><i class="far fa-arrow-alt-circle-right titulo"></i> INGRESAR</button>
  <button type="button" class="btn btn-secondary"><i class="far fa-address-card"></i> CANCELAR</button>
  <div id="error" class="alert alert-danger visually-hidden"
					role="alert">Usuario o contrase�a incorrecta!</div>
  <br>
  <br>
  <h6 class="titulo"> <<<<  �Olvidaste tu contrase�a?  >>>> </h6>
  <button type="button" class="btn btn-link titulo"><i class="fas fa-fingerprint"></i> Restablecer dando click  </button>
  <br>
  <br>
  <h6 class="titulo">---�Necesitas Ayuda?---</h6>
  <h6 class="titulo"><i class="fab fa-whatsapp"></i> Escribenos 321 520 7896</h6>
  <br>
  </center>
 

</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <div id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item">
                      
                        <a class="nav-link active" aria-current="page" href="index.html">
                          <center> </i>Equipo 7</a>
                        </center>
                    </li>
                </ul>
            </div>
        </div>
</nav>

<!-- Script que trae la informacion de la api y la compara con las entradas -->
	<script>
		function comparar() {
			//trayendo texto de input de username
			var x = document.getElementById("inputuser").value;
			//trayendo texto de input de password
			var y = document.getElementById("inputpass").value;
			//url de la api 
			var baseurl = "http://localhost:8080/listarusuarios";
			//creando un objeto de manipulacion de solicitudes
			var xmlhttp = new XMLHttpRequest();
			//abriendo la api
			xmlhttp.open("GET", baseurl, true);
			//funcion interna que compara la informaci�n
			xmlhttp.onreadystatechange = function() {
				//si se obtiene un 200 (Conexion correcta)
				if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
					//convirtiendo JSON en variable javascrip
					var usuarios = JSON.parse(xmlhttp.responseText);
					
					//verificando uno por uno si existe ese usuario
					for (i = 0; i < usuarios.length; i++) {
						
						//imprimiendo en la consola del navegador pata verificar
						console.log(usuarios);
						console.log(x);
						console.log(usuarios[i].usuario);
						console.log(y);
						console.log(usuarios[i].password);
						
						//si el nombre coincide
						if (usuarios[i].usuario === x) {
							//si la clave coincide
							if (usuarios[i].password === y) {
								console.log("si");
								var element = document.getElementById("error");
								element.classList.add("visually-hidden");
								document.getElementById("inputuser").value = "";
								document.getElementById("inputpass").value = "";
								window.location.href = "home.jsp";
								return;
							} else {
								//si la clave NO coincide
								console.log("error clave");
								var element = document.getElementById("error");
								element.classList.remove("visually-hidden");
								document.getElementById("inputuser").value = "";
								document.getElementById("inputpass").value = "";
								return;
							}
						}
					}
					//Si no existe el usuario
					console.log("no encontrado");
					
					//quitando la capacidad de ocultacion del error para mostrarlo
					var element = document.getElementById("error");
					element.classList.remove("visually-hidden");
					document.getElementById("inputuser").value = "";
					document.getElementById("inputpass").value = "";
					return;
				}
			};
			//ejecutando
			xmlhttp.send();
		}
	</script>
</body>

</html>