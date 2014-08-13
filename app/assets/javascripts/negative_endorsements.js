$(document).ready(function(){
	$('.negative-endorsement-link').on('click', function(event){
		var negativeEndorsementCount = $(this).siblings('.negative-endorsement-count')
		event.preventDefault();
		
		$.post(this.href, function(response) {
			negativeEndorsementCount.text(response.new_negative_endorsement_count);
		});
	})
})