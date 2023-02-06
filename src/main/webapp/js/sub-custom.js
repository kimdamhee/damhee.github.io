$(document).ready(function(){
  var width = $(window).width();

  $('#main-menu > li').on('mouseenter', function(){
    $(this).find('.sub-menu').stop().slideDown();
  });
  $('#main-menu > li').on('mouseleave', function(){
      $(this).find('.sub-menu').stop().slideUp();
  });
  
  if(width < 1050){

    $(function(e) {
      $('#trigger').on('click', function(e) {
          e.preventDefault();
          $(this).toggleClass('active');
          $('#main-menu').toggleClass('active');
      });
    });
  }
  
  if(width > 1400){ 
	  $('#main-menu > li').eq(0).on('mouseenter', function(){
	  	$(this).siblings('.mn-line').stop().animate({'left':'20px','width':'100px'},400);
	  });
	  $('#main-menu > li').eq(1).on('mouseenter', function(){
	    $(this).siblings('.mn-line').stop().animate({'left':'150px','width':'80px'},400);
	  });
	  $('#main-menu > li').eq(2).on('mouseenter', function(){
	    $(this).siblings('.mn-line').stop().animate({'left':'260px','width':'120px'},400);
	  });
	  $('#main-menu > li').eq(3).on('mouseenter', function(){
	    $(this).siblings('.mn-line').stop().animate({'left':'420px','width':'130px'},400);
	  });
	
	  $('#main-menu > li').eq(0).on('mouseleave', function(){
	    $(this).siblings('.mn-line').stop().animate({'width':'0'},400);
	  });
	  $('#main-menu > li').eq(1).on('mouseleave', function(){
	    $(this).siblings('.mn-line').stop().animate({'width':'0'},400);
	  });
	  $('#main-menu > li').eq(2).on('mouseleave', function(){
	    $(this).siblings('.mn-line').stop().animate({'width':'0'},400);
	  });
	  $('#main-menu > li').eq(3).on('mouseleave', function(){
	    $(this).siblings('.mn-line').stop().animate({'width':'0'},400);
	  });
	}else if(width > 1049 && width < 1400){
	  
	  $('#main-menu > li').eq(0).on('mouseenter', function(){
	  	$(this).siblings('.mn-line').stop().animate({'left':'5px','width':'90px'},400);
	  });
	  $('#main-menu > li').eq(1).on('mouseenter', function(){
	    $(this).siblings('.mn-line').stop().animate({'left':'105px','width':'50px'},400);
	  });
	  $('#main-menu > li').eq(2).on('mouseenter', function(){
	    $(this).siblings('.mn-line').stop().animate({'left':'170px','width':'100px'},400);
	  });
	  $('#main-menu > li').eq(3).on('mouseenter', function(){
	    $(this).siblings('.mn-line').stop().animate({'left':'285px','width':'120px'},400);
	  });
	
	  $('#main-menu > li').eq(0).on('mouseleave', function(){
	    $(this).siblings('.mn-line').stop().animate({'width':'0'},400);
	  });
	  $('#main-menu > li').eq(1).on('mouseleave', function(){
	    $(this).siblings('.mn-line').stop().animate({'width':'0'},400);
	  });
	  $('#main-menu > li').eq(2).on('mouseleave', function(){
	    $(this).siblings('.mn-line').stop().animate({'width':'0'},400);
	  });
	  $('#main-menu > li').eq(3).on('mouseleave', function(){
	    $(this).siblings('.mn-line').stop().animate({'width':'0'},400);
	  });
	}
});
