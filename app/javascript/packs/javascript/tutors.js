import $ from 'jquery';

{
  $('.js-apply').on('click', function(){
    let $this = $(this);

    $.ajax({
      url: gon.appointment_url,
      method: 'GET',
      data: {
        userId: gon.user_id,
        tutorId: gon.tutor_id,
      },
      success: function() {
        $this.text('Applied');
        $this.removeClass('btn-primary').addClass('btn-secondary')
      }
    })
  });
}