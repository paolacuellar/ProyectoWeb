var tabActual = 0;
var w=120; 
showTab(tabActual); 


function showTab(n) {
  
  var tab = document.getElementsByClassName("tab");
  tab[n].style.display = "block";
  
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (tab.length - 1)) {
    document.getElementById("nextBtn").type="submit";
    document.getElementById("nextBtn").innerHTML = "ENVIAR";
  } else {
    document.getElementById("nextBtn").innerHTML = "SIGUIENTE";
  }
}

function nextPrev(n) {
  
  var tab = document.getElementsByClassName("tab");
  
  if (n == 1 && !validateForm()) return false;
  if (n==1){
    w+=120;
    var progress = document.getElementById("progress");
    $(progress).css("width", w);
  }else{
    w-=120;
    var progress = document.getElementById("progress");
    $(progress).css("width", w);
  }
  
  tab[tabActual].style.display = "none";
  
  tabActual = tabActual + n;
  
  if (tabActual >= tab.length) {
    
    document.getElementById("FormContainer").submit();
    return false;
  }
  
  showTab(tabActual);
}

function validateForm() {
  // This function deals with validation of the form fields
  var tab, input, i, valid = true;
  tab = document.getElementsByClassName("tab");
  input = tab[tabActual].getElementsByTagName("input");

  for (i = 0; i < input.length; i++) {

    if (input[i].value == "") {

      input[i].className += " invalid";
      
      valid = false;
    }
  }
  return valid; 
}
