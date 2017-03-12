$(document).ready(function(){

    //contact form validation
    $("#contact-form").validate({
        rules: {
            name: {
                required: true,
                minlength: 2
            },
            message: {
                required: true,
                minlength: 2
            },
            email: {
                required: true,
                email: true
            }
        },
        messages: {
            name: {
                required: "Please enter Your Name",
                minlength: "Your name must consist of at least 2 characters"
            },
            message: {
                required: "Please Write Something",
                minlength: "Your message must consist of at least 2 characters"
            },
            email: "Please enter a valid email address"
        },
        submitHandler: function(form) {
            $(form).ajaxSubmit({
                type:"POST",
                data: $(form).serialize(),
                url:"https://docs.google.com/forms/d/e/1FAIpQLSfl07WqpeMQOAyNRb2jc3fpe3ZBOCuqvMRr43F4wXsS3aKFfA/formResponse",
                
                success: function() {
                    $('#contact-form :input').attr('disabled', 'disabled','disabled','disabled');
                    $('#contact-form').fadeTo( "slow", 0.15, function() {
                        $(this).find(':input').attr('disabled','disabled','disabled', 'disabled');
                        $(this).find('label').css('cursor','default');
                        $('#success').fadeIn();
                    });
                },
                error: function() {
                    $('#contact-form :input').attr('disabled', 'disabled', 'disabled', 'disabled');
                    $('#contact-form').fadeTo( "slow", 0.15, function() {
                        $(this).find(':input').attr('disabled', 'disabled', 'disabled', 'disabled');
                        $(this).find('label').css('cursor','default');
                        $('#success').fadeIn();
                    });
                }
            });
        }
    });

});