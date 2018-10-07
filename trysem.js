


    var AYLIENTextAPI = require('aylien_textapi');
    var textapi = new AYLIENTextAPI({
    application_id: "59804a19",
    application_key: "4874a90bce44a4e2a6365738544598a0"
    });

    textapi.sentiment({
        'text': 'Today is a rainy day!'
        }, function(error, response) {
        if (error === null) {
            console.log(response);
        }
    });

