$(function(){

    $('.faq_list li p a').on('click', function () {
        $(this).parent().next('div').slideToggle("fast");
        $(this).parent().parent().toggleClass('selected');
    });

    $('.usermenu button').on('click', function () {
        $(this).parent().toggleClass('on');
    });

    $('.search_option button').on('click', function () {
        $('.search_option').toggleClass("on");
        $('.search_option').find('ul').slideToggle('fast');
    });
    $('.search_option label').on('click', function () {
        $('.search_option').toggleClass("on");
        $('.search_option').find('ul').slideToggle('fast');
        $('.search_option button span').text($(this).text());

        $('.search_option li label').removeClass('on');
        $(this).addClass('on');
    });

    $('.btn_pop_cancel').on('click', function () {
        $(this).parent().parent().parent().hide();
    });

    $('.main_snb .snb .btn_edit').on('click', function () {
        $(this).next('div').toggle();
    });
    $('.main_snb .snb .snb_pop').find('button').on('click', function () {
        $(this).parent().toggle();
    });
    $('.btn_bookmark_edit').on('click', function () {
        $('#pop_bookmark_edit').show();
    });
    $('.btn_bookmark_del').on('click', function () {
        $('#pop_bookmark_del').show();
    });


    $('.select_memberType label').on('click', function () {
        $('.wrap_memberType').children('div').hide();
        $('.wrap_memberType').children('div:eq( ' + $(this).index() + ' )').show();
    });

});