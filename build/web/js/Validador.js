/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function validador() {

    var contra1 = document.getElementById("txtpasword").value;
    var contra2 = document.getElementById("txtpaswordconfir").value;
    if (contra1 != contra2) {

        /*document.getElementById("alert").innerHTML="contraseña no cooinsiden vuelva  a intentarlo";*/
        document.getElementById("txtpasword").value = "";
        document.getElementById("txtpaswordconfir").value = "";

        alert("LA CONTRASEÑA NO COICIDE POR FAVOR VALIDE HE INTENTE DE NUEVO ");

    }

    $(function () {
        $('#datetimepicker1').datetimepicker({
            language: 'pt-BR'
        });
    });

$('#sandbox-container .input-group.date').datepicker({
});
  
} 