$(document).ready(function(){
  
  $(window).scroll(function(event){
    var scroll = $(window).scrollTop();
    var width = $(window).width();
    
    console.log(scroll);

    if(width >= 1400){
      if(scroll > 140) {
        $('nav').css('background','#fff');
      }else {
        $('nav').css('background','#666');
      }
      if(scroll > 300 && scroll <= 500) {
        $('.ma-con-2').animate({'right':'0', 'opacity':'0.85'}, 600);
      }else if(scroll > 500 && scroll <= 700) {
        $('.ma-con-3').animate({'left':'0', 'opacity':'0.85'}, 600);
      }else if (scroll > 900) {
        $('.ma-con-4').animate({'right':'0', 'opacity':'0.85'}, 600);
      }
    }else if(width >= 1050 && width < 1400){
      if(scroll > 150) {
        $('nav').css('background','#fff');
      }else {
        $('nav').css('background','#666');
      }
      if(scroll > 150 && scroll <= 300) {
        $('.ma-con-2').animate({'right':'0', 'opacity':'0.85'}, 600);
      }else if(scroll > 300 && scroll <= 550) {
        $('.ma-con-3').animate({'left':'0', 'opacity':'0.85'}, 600);
      }else if (scroll > 550) {
        $('.ma-con-4').animate({'right':'0', 'opacity':'0.85'}, 600);
      }
    }else if(width >= 600 && width < 1050){
      if(scroll > 100 && scroll <= 200) {
        $('.ma-con-2').animate({'right':'0', 'opacity':'0.85'}, 600);
      }else if(scroll > 200 && scroll <= 300) {
        $('.ma-con-3').animate({'left':'0', 'opacity':'0.85'}, 600);
      }else if (scroll > 300) {
        $('.ma-con-4').animate({'right':'0', 'opacity':'0.85'}, 600);
      }
    }
  });
});