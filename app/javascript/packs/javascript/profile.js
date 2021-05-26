import $ from 'jquery';
import 'select2';
import 'select2/dist/css/select2.css';

{
  $(document).ready(function() {
    $('#user_subject_list').select2({
      theme: "classic"
    });
  });
}