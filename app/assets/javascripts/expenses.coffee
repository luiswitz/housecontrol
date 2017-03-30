$('label[for^="q_month_eq_"').click ->
  console.log 'clicked'
  $(this).next('input').attr('checked', 'checked')
  this.form.submit()

$('#q_year_eq').change ->
  this.form.submit();
