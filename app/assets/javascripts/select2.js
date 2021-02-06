$(document).ready(function() {
  $('.searchable').select2({
    maximumSelectionLength: 5,
	  width: 300,
    placeholder: 'This is my placeholder',
    allowClear: true  # default: true
  });
});
