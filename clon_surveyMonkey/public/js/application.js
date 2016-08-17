$(document).ready(function() {
	// Este código corre después de que `document` fue cargado(loaded) 
	// completamente. 
	// Esto garantiza que si amarramos(bind) una función a un elemento 
	// de HTML este exista ya en la página. 
  $( document.body ).find("#show").click(function() {
    $( "#div_hide" ).fadeIn( "slow" );
    $( this ).empty();
    $( document.body ).find( "#hide" ).append( "<strong> Ocultar </strong>" );
  });

  $( document.body ).find("#hide").click(function() {
    $( "#div_hide" ).fadeOut( "slow" );
    $( this ).empty();
    $( document.body ).find( "#show" ).append( "<strong> Mostrar Formulario </strong>" );
  });

});
