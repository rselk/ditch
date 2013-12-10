# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery -> 
  $('.time_alert').datetimepicker({
  dateFormat: 'yy-mm-dd',
  timeFormat: 'HH:mm z',
  timezone: 'MT',
  timezoneList: [ 
      { value: 'ET', label: 'Eastern'}, 
      { value: 'CT', label: 'Central' }, 
      { value: 'MT', label: 'Mountain' }, 
      { value: 'PT', label: 'Pacific' } 
    ]
});