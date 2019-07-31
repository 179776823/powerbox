$('#headmenu .button').on('click', function(e) {
    const target = e.currentTarget.id.replace('headmenu_', '');
    
    if (target === 'mnuSystemSet') {
        $('#XojoDialogs #EhvgfUkd').css('display', 'block');
        return;
    }
    
    $('#XojoMenus').css('display', 'block');
    $('#XojoMenus > div').css('display', 'none');
    $("#" + target).css('display', 'block');


});

$('#EhvgfUkd').on('click', function(e) {
    if(e.target.id === 'EhvgfUkd') {
        $(e.target).hide();
    }
});
