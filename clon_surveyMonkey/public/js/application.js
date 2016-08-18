$(document).ready(function() {
	// Este código corre después de que `document` fue cargado(loaded) 
	// completamente. 
	// Esto garantiza que si amarramos(bind) una función a un elemento 
	// de HTML este exista ya en la página. 
  $( document.body ).find("#show").click(function() {
    $( "#div_hide" ).fadeIn( "slow" );
    $( this ).empty();
    $( document.body ).find( "#hide" ).append( " Ocultar " );
  });

  $( document.body ).find("#hide").click(function() {
    $( "#div_hide" ).fadeOut( "slow" );
    $( this ).empty();
    $( document.body ).find( "#show" ).append( " Mostrar " );
  });

  $( document.body ).find(".chulada_btn").each(function(){
    $(this).hover(
      function(){
        $(this).css({ 
          "background-color": "#a692ff",
          "border": "1px dotted #FFFFFF"
           });
      },
      function(){
        $(this).css({
          "background-color": "transparent",
          "border": "1px solid #9670FF"
          });
      }
    );
  });

//$(function(){}) shortcut ready document

    $("#add").click(function() {
        var intId = $("#add_field div").length + 1;
        var fieldWrapper = $("<div class=\"fieldwrapper\" id=\"field" + intId + "\"/>");
        //var fName = $("<input type=\"text\" class=\"fieldname\" />");
        var fName = $("<form action=\"/new_question/<%= @survey.id%>\" method=\"POST\"><input type=\"text\" name=\"question[body"+ intId +"]\" placeholder=\"Pregunta!\"><div id=\"clear\"></div><input class=\"chulada_btn\" type=\"submit\" value=\"Preguntar\"><end>");
        //var fType = $("<select class=\"fieldtype\"><option value=\"checkbox\">Checked</option><option value=\"textbox\">Text</option><option value=\"textarea\">Paragraph</option></select>");
        var removeButton = $("<input type=\"button\" class=\"remove chulada_btn\" value=\"Remove\" /><div id=\"clear\"></div>");
        removeButton.click(function() {
            $(this).parent().remove();
        });
        fieldWrapper.append(fName);
        //fieldWrapper.append(fType);
        fieldWrapper.append(removeButton);
        $("#add_field").append(fieldWrapper);
    });    

});//document.ready
  



//Comentario para hacer espacios xD