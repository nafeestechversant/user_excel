$(function() {
    $("#upload_link").on('click', function(e) {
        e.preventDefault();
        $("#fld_userExcel:hidden").trigger('click');
    });
});