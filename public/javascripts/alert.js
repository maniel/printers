$(function() {
    $.alerts.okButton = 'Tak';
    $.alerts.cancelButton = 'Nie';
    $(".potwierdzenie").click( function() {
        var url = $(this).attr('href');
        jConfirm('Czy jesteś pewien?', 'Potwierdzenie', function(r) {
            if(r){
                location.href = url;
            }
        });
        return false;
    });
})
