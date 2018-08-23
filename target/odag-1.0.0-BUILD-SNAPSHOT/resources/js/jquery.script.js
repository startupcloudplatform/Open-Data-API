$('.faq_list li p a').on('click', function(){
    $(this).parent().next('div').slideToggle("fast");
    $(this).parent().parent().toggleClass('selected');
});

$('.usermenu button').on('click', function(){
    $(this).parent().toggleClass('on');
});

$('.search_option button').on('click', function(){
    $('.search_option').toggleClass("on");
    $('.search_option').find('ul').slideToggle('fast');
});
$('.search_option label').on('click', function(){
    $('.search_option').toggleClass("on");
    $('.search_option').find('ul').slideToggle('fast');
    $('.search_option button span').text( $(this).text() );

    $('.search_option li label').removeClass('on');
    $(this).addClass('on');
});