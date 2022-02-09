
function consumirServicio(option) {
    let config = {
        headers: {
            Accept: 'application/json',
            'Content-Type': 'application/json'
        },
        method: 'POST',
        body: JSON.stringify({
            option: option,
            data: getData(option)
        })
    }

    fetch('classes/colegioClass.php', config)
        .then(res => res.json())
        .then(res => {
            service = false;
            dissmissLoader();
            responseData(res);
        });
}

function getData(option) {
    switch (option) {
        case 'getAsignatureByTeacher':
            return {
                idTeacher: $('#button1').val()
            };
    }
}

function responseData(res) {
    switch (res.option) {
        case 'getAsignatureByTeacher':
            // updateTabla(res.filtro);
            alert(res);
            break;
    }
}