$(function() {
  return $('#member_postcode').jpostal({
    postcode: ['#member_postcode'],
    address: {
      '#member_address': '%3%4%5%6%7',
    },
  });
});

$(function() {
	return $('#shipping_postcode').jpostal({
		postcode: ['#shipping_postcode'],
		address: {
			'#shipping_address': '%3%4%5%6%7',
		},
	});
});


$(function() {
	return $('#order_postcode').jpostal({
		postcode: ['#order_postcode'],
		address: {
			'#order_address': '%3%4%5%6%7',
		},
	});
});

