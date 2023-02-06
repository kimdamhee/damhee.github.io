$(document).ready(function(){
  
  $(window).scroll(function(event){
    var scroll = $(window).scrollTop();
    var width = $(window).width();

    if(width >= 1400){
      if(scroll > 140) {
        $('nav').css('background','#fff');
      }else {
        $('nav').css('background','none');
      }
      if(scroll > 300 && scroll <= 500) {
        $('.wo-con-2').animate({'right':'0', 'opacity':'0.85'}, 600);
      }else if(scroll > 500 && scroll <= 700) {
        $('.wo-con-3').animate({'left':'0', 'opacity':'0.85'}, 600);
      }else if (scroll > 900) {
        $('.wo-con-4').animate({'right':'0', 'opacity':'0.85'}, 600);
      }
    }else if(width >= 1050 && width < 1400){
      if(scroll > 150) {
        $('nav').css('background','#fff');
      }else {
        $('nav').css('background','none');
      }
      if(scroll > 150 && scroll <= 300) {
        $('.wo-con-2').animate({'right':'0', 'opacity':'0.85'}, 600);
      }else if(scroll > 300 && scroll <= 550) {
        $('.wo-con-3').animate({'left':'0', 'opacity':'0.85'}, 600);
      }else if (scroll > 550) {
        $('.wo-con-4').animate({'right':'0', 'opacity':'0.85'}, 600);
      }
    }else if(width >= 600 && width < 1050){
      if(scroll > 100 && scroll <= 200) {
        $('.wo-con-2').animate({'right':'0', 'opacity':'0.85'}, 600);
      }else if(scroll > 200 && scroll <= 300) {
        $('.wo-con-3').animate({'left':'0', 'opacity':'0.85'}, 600);
      }else if (scroll > 300) {
        $('.wo-con-4').animate({'right':'0', 'opacity':'0.85'}, 600);
      }
    }
  });
});