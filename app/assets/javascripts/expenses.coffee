# Expensess filter
$('label[for^="q_month_eq_"').click ->
  console.log 'clicked'
  $(this).next('input').attr('checked', 'checked')
  this.form.submit()

$('#q_year_eq').change ->
  this.form.submit();

# Expenses form
form_of_payment = $('#expense_form_of_payment')
credit_card_id = $('#expense_credit_card_id')
form_of_payment.change ->
  if form_of_payment.val() == "1"
    credit_card_id.css('display', 'block')
    credit_card_id.prev('label').css('display', 'block')

generate_parcels = ->
  $.get
    url: 'create_parcels'
    data:
      parcels: $('#number_of_parcels').val()
      total_value: $('#expense_value').val()
      expensed_at: $('#expense_expensed_at').val()

parceled = $('#expense_parceled')
number_of_parcels = $('#number-of-parcels')
parceled.click ->
  if parceled.is(':checked')
    number_of_parcels.css('display', '')
  else
    number_of_parcels.css('display', 'none')

$('#expense_value, #number-of-parcels, #expense_expensed_at').change ->
  if parceled.is(':checked') && $('#number_of_parcels').val() != ""
    do generate_parcels
