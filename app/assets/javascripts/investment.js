$('#investment_second_owner_name').autocomplete({
    source: function( req, resp ) {
        $.post( "/echo/json/", {
            json: '["1", "2", "3", "4", "5"]',
            delay: 1
        }, function(data) {
            resp( data );
        }, "JSON" );
    }
});
$('.delete_investment').bind('ajax:success', function() {
	$(this).closest('tr').fadeOut();
});

  