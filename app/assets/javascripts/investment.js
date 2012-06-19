$('.delete_investment').bind('ajax:success', function() {
	$(this).closest('tr').fadeOut();
});