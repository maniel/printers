$(function() {
  $(".data").datepicker({
    dateFormat: 'dd-mm-yy',
    monthNames: [ 'styczeń', 'luty', 'marzec', 'kwiecień', 'maj', 'czerwiec', 'lipiec', 'sierpień', 'wrzesień', 'październik', 'listopad', 'grudzień'],
    dayNamesMin: ['nd','po', 'wt', 'sr', 'cz', 'pt', 'so'],
    firstDay: 1
  });
});
