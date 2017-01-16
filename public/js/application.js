/*Este método se ejecutara simpre y cuándo el usuario tenga instalado Javascript*/
/*Recordemos que Javascript en código lo podemos llamar mediante "$"*/
$(document).ready(function() {
/*Aquí estamos dando la instruccion de todo lo que 
contenga el submint de la form1 (HTML)*/
  $("#form1").on("submit", function(event){
    event.preventDefault();
    /*Haráun post a la direccion 'rolls', en dónde
    se le enviará la información(data) que en este caso
    es @win y @rolls*/
    $.post('/rolls', function( data ) {
      console.log(data);
      /*Esta información la regresa nuevamente al modelo para pasar las validaciones
      correspondientes en _die_roll.erb*/
      
      $("#die").html(data);
    });
  });
});

