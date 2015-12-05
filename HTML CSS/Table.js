/*function ajaxFunction(){
    var ajaxRequest;
    try{
         // Opera 8.0+, Firefox, Safari
      ajaxRequest = new XMLHttpRequest();
   }catch (e){
      
      // Internet Explorer Browsers
      try{
         ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
      }catch (e) {
         
         try{
            ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
         }catch (e){
         
            // Something went wrong
            alert("Your browser broke!");
            return false;
         }
    }
  }
ajaxRequest.onreadystatechange = function(){
  if(ajaxRequest.readyState == 4){
    var ajaxDisplay = document.getElementById('ajaxDiv')
    ajaxDisplay.innerHTML = ajaxRequest.responseText;
  }
}
    var item = document.getElementById("item").value;
    var price = document.getElementById("price").value;
    var location = document.getElementById("location").value;
    var queryString = "?item=" + item;

    queryString += "&price" + price + "&location" + location;
   ajaxRequest.open("Get", "Ajax-example.php"+ queryString, true);   
   ajaxRequest.send(null);
}*/
$(document).ready(function)
{
	$("#display".click(function(){
	$.ajax({
		type:"GET",
		url:"display.php",
		dataType:"html",
		success:function(response){
			$("#responsecontainer").html(response);
		}
	});
});
function addRow() { 
          
    var item = document.getElementById("item");
    var price = document.getElementById("price");
    var location = document.getElementById("location")
    var table = document.getElementById("myTableData");
 
    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);
 
    row.insertCell(0).innerHTML= <input type="button" value = "Delete" onClick="Javacsript:deleteRow(this)">;
    row.insertCell(1).innerHTML= item.value;
    row.insertCell(2).innerHTML= price.value;
    row.insertCell(3).innerHTML= location.value;
}
 
function deleteRow(obj) {
      
    var index = obj.parentNode.parentNode.rowIndex;
    var table = document.getElementById("myTableData");
    table.deleteRow(index);
    
}
 
function addTable() {
      
    var myTableDiv = document.getElementById("myDynamicTable");
      
    var table = document.createElement('TABLE');
    table.border='1';
    
    var tableBody = document.createElement('TBODY');
    table.appendChild(tableBody);
      
    for (var i=0; i<3; i++){
       var tr = document.createElement('TR');
       tableBody.appendChild(tr);
       
       for (var j=0; j<4; j++){
           var td = document.createElement('TD');
           td.width='75';
           td.appendChild(document.createTextNode("Cell " + i + "," + j));
           tr.appendChild(td);
       }
    }
    myTableDiv.appendChild(table);
    
}
 
function load() {
    
    console.log("Page load finished");
 
}
/*function showTable(str) {
  //var xhttp;  
  var str = document.getElementById("word").value;
  var div = document.getElementById("table");
  var txt = document.getElementById("wordTxt");
  var url = "ajax.php";  
  if (str !== "") {
  txt.innerHTML = "<h2> Table"+value+"</h2>";
  div.innerHTML= "loading...."
  xml = new XMLHttpRequest();
  xml.open("POST",url,false);
  xml.setRequestHeader("content-type","application/x-www-form-urlencoded");
  xml.onreadystatechange = function() {
    if (xml.readyState == 4 && xml.status == 200) {
          div.innerHTML = xml.responseText;
    }
  }
      var v = "word=" +value;
      xml.send(v);
  } else if(str == "") {
txt.innerHTML= "";
div.innerHTML= "";  }
}*/
 // xml.open("GET", "connect.php"+str, true);
  //xml.send();
  //xml.setRequestHeader("content-type","application/x-www-form-urlencoded");
  /*  var v = "word=" +value;
    xml.s
	end(v);*/



/*//$('input#name-submit').on('click',function(){
  var name = $('input#name').val();
  if($.trim(n) !='')
  {
    $.post('Ajax/ajax.php',{item: item}, function(data)
      {
        $('div#item-data').text(data);
      });
  }

}});
}