$(window).on('turbolinks:load', function() {
  $(document).ready(function(){
    $('#book').DataTable({
      "bInfo": false,
      'bPaginate': false
    });
  });

  $(document).ready(function(){
    $('#category').DataTable({
      "bInfo": false,
      'bPaginate': false
    });
  });

  $(document).ready(function(){
    $('#author').DataTable({
      "bInfo": false,
      'bPaginate': false
    });
  });

  $(document).ready(function(){
    $('.owl-carousel').owlCarousel();
  });
})
