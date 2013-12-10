# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery -> 
$('#time_alert').datetimepicker({
  timeFormat: 'HH:mm z',
  timezoneList: [ 
      { value: -300, label: 'Eastern'}, 
      { value: -360, label: 'Central' }, 
      { value: -420, label: 'Mountain' }, 
      { value: -480, label: 'Pacific' } 
    ]
});