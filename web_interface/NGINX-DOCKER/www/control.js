//
//
//

//-----------------------------------------
var version_info = "alpha - 0.0.1";
//var server_url = "http://localhost:5000/hello"
var server_url = "https://192.168.1.120:8088/api/v1/"
//-----------------------------------------

var data_1 = JSON.stringify({ "command": "True","server": "poll_server_PYModbus","login": "server","password": "0000"});
var data_2 = JSON.stringify({ "command": "False","server": "poll_server_PYModbus","login": "server","password": "0000"});

function versionsetinfo() {
    var version = version_info;
    var set_info = document.getElementById("version");
    set_info.textContent = version_info;
}

// Sending and receiving data in JSON format using POST method
function send_data(send_url, send_data) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", send_url, true);
    xhr.setRequestHeader("Content-Type", "application/json");
    // xhr.onreadystatechange = function () {
    //     if (xhr.readyState === 4 && xhr.status === 200) {
    //         var json = JSON.parse(xhr.responseText);
    //         console.log(json.email + ", " + json.password);
    //     }
    // };
    xhr.send(send_data);
}



function start_pollpy() {
    send_data(server_url, data_1)
}


function stop_pollpy() {
    send_data(server_url, data_2)

}

function update_status(url) {
    fetch(url)
    .then(res => res.json())
    .then((out) => {
        var obj = out;
        var message = obj.state;
        var statis_block = document.getElementById("scr");
        statis_block.textContent = "server is: "+message;
        console.log('Checkout this JSON! ', out);
    })
    .catch(err => { throw err });
}

function data_loader() {
    versionsetinfo()
}

var update_interface = setInterval(function() {
    update_status(server_url)
},500);

window.onload = data_loader;

// msg_info_angular = twist.angular.z;
// msg_info_linear = twist.linear.x;
// //
// var body_msg_linear = document.getElementById("scr");
// var body_msg_angular = document.getElementById("scp");
// //
// body_msg_linear.textContent = "Twist_MSG: linear.x= "+msg_info_linear;
// body_msg_angular.textContent = "Twist_MSG: angular.z= "+msg_info_angular;

