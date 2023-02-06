$(document).ready(function(){
    var width = $(window).width();

    if(width >= 1400){

      $('article').on('mouseenter', function(){
        $(this).find('h3').stop().animate({'left':'20px', 'bottom':'66%', 'width':'50%', 'height':'40px'}, 600).css('font-size','24px');
        $(this).find('.menu h2').stop().animate({'right':'20px', 'opacity':'0.9'}, 400);
        $(this).find('.menu p').stop().animate({'right':'20px', 'opacity':'0.7'}, 800);
        $(this).find('.menu a').stop().animate({'right':'20px','bottom':'20%', 'opacity':'1'}, 400);
        $(this).find('video').stop().animate({'opacity':'0.9'}, 1500);
        
      });
      $('article').on('mouseleave', function(){
        $(this).find('video').stop().animate({'opacity':'0'}, 1200);
        $(this).find('h3').stop().animate({'left':'45%','bottom':'0', 'width':'100%', 'height':'50%'}, 400).css('font-size','36px');
        $(this).find('.menu a').stop().animate({'right':'-320px','bottom':'0', 'opacity':'0'}, 400);
        $(this).find('.menu h2').stop().animate({'right':'-320px', 'opacity':'0'}, 200);
        $(this).find('.menu p').stop().animate({'right':'-320px', 'opacity':'0'}, 400);
      });


      $('.sitemap > li').on('mouseenter', function(){
          $(this).find('.submn').stop().slideDown();
      });
      $('.sitemap > li').on('mouseleave', function(){
          $(this).find('.submn').stop().slideUp();
      });

    }else if(width >= 1050 && width < 1400){

      $('article').on('mouseenter', function(){
        $(this).find('h3').stop().animate({'left':'20px', 'bottom':'66%', 'width':'50%', 'height':'40px'}, 600).css('font-size','24px');
        $(this).find('.menu h2').stop().animate({'right':'20px', 'opacity':'0.9'}, 400);
        $(this).find('.menu p').stop().animate({'right':'20px', 'opacity':'0.7'}, 800);
        $(this).find('.menu a').stop().animate({'right':'20px','bottom':'20%', 'opacity':'1'}, 400);
        $(this).find('video').stop().animate({'opacity':'0.9'}, 1500);
        
      });
      $('article').on('mouseleave', function(){
        $(this).find('video').stop().animate({'opacity':'0'}, 1200);
        $(this).find('h3').stop().animate({'left':'45%','bottom':'0', 'width':'100%', 'height':'50%'}, 400).css('font-size','36px');
        $(this).find('.menu a').stop().animate({'right':'-320px','bottom':'0', 'opacity':'0'}, 400);
        $(this).find('.menu h2').stop().animate({'right':'-320px', 'opacity':'0'}, 200);
        $(this).find('.menu p').stop().animate({'right':'-320px', 'opacity':'0'}, 400);
      });

      $('.sitemap > li').on('mouseenter', function(){
        $(this).find('.submn').stop().slideDown();
      });
      $('.sitemap > li').on('mouseleave', function(){
          $(this).find('.submn').stop().slideUp();
      });
    }
});
