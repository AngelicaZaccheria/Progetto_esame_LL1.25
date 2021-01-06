function resetLine(name){
   for (var i = 0; i < 94;i++){
     document.getElementsByTagName('a').item([i]).className='reset-riga';
   }
   document.getElementsByName(name).item(0).className='riga';
  }

  var prevLine = null;
  function resetLine(name){
    if (prevLine != null) {
      prevLine.style.backgroundColor =  "white";
    }
    console.log(name);
    var element = document.getElementsByName(name).item(0);
    element.style.backgroundColor = "blue";
    prevLine = element;
  }


  function gestoreResize () {
    try {
       var attualeDimensioneFoto = nodoLettera1.width;
       var ratio = attualeDimensioneFoto / dimensioneFoto;
       for (var i = 0; i < nodiArea.length; i++) {
          for (var j = 0; j < coordinateAree[i].length; j++) {
             coordinateAree[i][j] /= ratio;
          }
           nodiArea[i].coords = coordinateAree[i].join(',');
       }
       attualeDimensioneFoto = dimensioneFoto;
       nodoLettera1.setAttribute("width", dimensioneFoto);

       var attualeDimensioneFoto = nodoLettera2.width;
       var ratio = attualeDimensioneFoto / dimensioneFoto;
       for (var i = 0; i < nodiArea2.length; i++) {
          for (var j = 0; j < coordinateAree2[i].length; j++) {
             coordinateAree2[i][j] /= ratio;
          }
           nodiArea2[i].coords = coordinateAree2[i].join(',');
       }
       attualeDimensioneFoto = dimensioneFoto;
       nodoLettera2.setAttribute("width", dimensioneFoto);


    } catch ( e ) {
       alert("gestoreResize " + e);
    }
  }

  var LARGHEZZA_FOTO = 542;
  var nodoLettera1;
  var nodoLettera2;

  var nodiArea;
  var nodiArea2;

  var coordinateAree;
  var coordinateAree2;

  var dimensioneFoto;

  function gestoreLoad () {
    try {
       nodiArea = document.getElementsByClassName("LL1.25_folio_1fr_class");
       nodoLettera1 = document.getElementById("imglettera1");
       nodiArea2 = document.getElementsByClassName("LL1.25_folio_1fv_class");
       nodoLettera2 = document.getElementById("imglettera2");

       coordinateAree = [];
       coordinateAree2 = [];

       for (var i = 0; i < nodiArea.length; i++){
          var nodoArea = nodiArea[i];
          coordinateAree[i] = nodoArea.coords.split(',');
        }
        for (var i = 0; i < nodiArea2.length; i++){
         var nodoArea2 = nodiArea2[i];
         coordinateAree2[i] = nodoArea2.coords.split(',');
       }
       dimensioneFoto = LARGHEZZA_FOTO;

       gestoreResize();
     } catch ( e ) {
        alert ("gestoreLoad " + e);
     }
  }

  window.onload = gestoreLoad;
