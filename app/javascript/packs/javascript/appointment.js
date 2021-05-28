import $ from 'jquery';

{
  $('.js-update').on('click', function(){
    let $this = $(this);
    let status = $this.data('value')

    $.ajaxSetup({
      headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') }
    });

    $.ajax({
      url: gon.appointment_url,
      method: 'PATCH',
      data: { status: status },
      success: function() {
        location.reload();
      }
    })
  });
}