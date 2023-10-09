var conn = new WebSocket('ws://localhost:8080/DrPharma/socket');
function send(message) {
    conn.send(JSON.stringify(message));
}