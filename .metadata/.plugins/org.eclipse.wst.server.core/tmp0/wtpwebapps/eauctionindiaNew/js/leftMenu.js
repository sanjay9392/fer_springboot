$(document).ready(function(){
	 var url = window.location.href;
	 $("div.cssmenu ul.panel li").click(function(){
		 localStorage.setItem("is",$(this).children().get(0).href);
	 });
	   

	 $("div#sses3 ul li").click(function(){
		 localStorage.clear();
	 });
	   
	$("div.cssmenu ul.panel li").each(function(){
	     if(localStorage.getItem('is') == $(this).children().get(0).href){
	          $(this).addClass('current'); 
	     }
	     else{
	    	 $(this).removeClass('current');
	     } 
	});
		
	
});
