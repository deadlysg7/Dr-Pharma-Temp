<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Webcam Video Capture</title>
</head>
<body>
	<video style="width:500px ;height:500px" id="vid" src ="" autoplay ></video>
	<video style="width:500px ;height:500px" id="vid2" src ="" autoplay ></video>
	<button onclick="handleClick()">SAY HELLO</button>
	<h1 id="chat"></h1>
	<script>
	var  videoElement = document.getElementById("vid");
	var  videoElement2= document.getElementById("vid2")
console.log(videoElement,videoElement2)
	var conn = new WebSocket('ws://localhost:8080/DrPharma/chat');
	function handleClick() {
		/*
	    var message = {
	        text: "Hello, server!"
	    };

	    send(message);
		*/
	 // creating offer
		peerConnection.createOffer(function(offer) {
		    send({
		        event : "offer",
		        data : offer
		    });
		    peerConnection.setLocalDescription(offer);
		}, function(error) {
		    // Handle error here
		    console.log(error)
		});
	    
	}

	function send(message) {
	    conn.send(JSON.stringify(message));
	}
	conn.onopen = function(event) {
	    // WebSocket connection is open
	    console.log("WebSocket connection opened:", event);
	};

	conn.onmessage = function(event) {
	    // Handle incoming messages from the server
	    var message = JSON.parse(event.data);
	   // var message = event.data.toString();
	    console.log("Received message:", message);
		//Receiving the ICE Candidate
		if(message.event == "candidate"){ peerConnection.addIceCandidate(new RTCIceCandidate(message.data));  }
		else if (message.event == "offer") {
			//Receiving the Offer
			peerConnection.setRemoteDescription(new RTCSessionDescription(message.data));
			peerConnection.createAnswer(function(answer) {
			    peerConnection.setLocalDescription(answer);
			        send({
			            event : "answer",
			            data : answer
			        });
			}, function(error) {
			    // Handle error here
			});
		} else if (message.event == "answer") {
			// Receiving the Answer
			function handleAnswer(answer){
		    	peerConnection.setRemoteDescription(new RTCSessionDescription(answer));
			}
			handleAnswer(message.data)
			dataChannel.onmessage = function(event) {
			    console.log("Message:", event.data);
			};
			peerConnection.ondatachannel = function (event) {
			    dataChannel = event.channel;
			};
			
		}
		else{
			console.log("else", message);
		}
	    // Display the message in a chat area (assuming you have a chat element with id="chat")
	    var chatElement = document.getElementById("chat");
	    chatElement.innerHTML += message.text + "<br>";
	};


	conn.onclose = function(event) {
	    // WebSocket connection is closed
	    console.log("WebSocket connection closed:", event);
	};

	conn.onerror = function(event) {
	    // Handle WebSocket errors
	    console.error("WebSocket error:", event);
	};

	
	//WEB RTC 
	configuration = {
			  'iceServers': [
				    {
				      'urls': 'stun:stun.l.google.com:19302'
				    },
				    {
				      'urls': 'turn:10.158.29.39:3478?transport=udp',
				      'credential': 'XXXXXXXXXXXXX',
				      'username': 'XXXXXXXXXXXXXXX'
				    },
				    {
				      'urls': 'turn:10.158.29.39:3478?transport=tcp',
				      'credential': 'XXXXXXXXXXXXX',
				      'username': 'XXXXXXXXXXXXXXX'
				    }
				  ]
	};
	var peerConnection = new RTCPeerConnection(configuration);
	var dataChannel = peerConnection.createDataChannel("dataChannel", { reliable: true });
	dataChannel.onerror = function(error) {
	    console.log("Error:", error);
	};
	dataChannel.onclose = function() {
	    console.log("Data channel is closed");
	};
	
	// Create Send ICE Candidates
	peerConnection.onicecandidate = function(event) {
	    if (event.candidate) {
	        send({
	            event : "candidate",
	            data : event.candidate
	        });
	    }
	};



	//SENDING AUDIO AND VIDEO
	const constraints = {
    	video: true,audio : true
	};
	navigator.mediaDevices.getUserMedia(constraints).then(function(stream) { 
		peerConnection.addStream(stream);
		videoElement2.srcObject = stream;
		console.log("1nd stream is", stream);
	}).catch(function(err) { console.log(err) });
	
	peerConnection.onaddstream = function(event) {
		console.log("2nd stream is", event.stream);
	    videoElement.srcObject = event.stream;
	};
	</script>
</body>
</html>

