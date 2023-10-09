package com.routes;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

@ServerEndpoint("/chat")
public class ChatEndpoint {

    // Store connected sessions in a set to manage multiple clients
    private static final Set<Session> sessions = Collections.synchronizedSet(new HashSet<>());

    @OnOpen
    public void onOpen(Session session) {
        // Add the new WebSocket session to the set
        sessions.add(session);
//        broadcast("New user joined the chat");
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        // Broadcast the received message to all connected clients
    	 String senderId = session.getId();
    	 broadcastToOthers(message, session);
       
    	//SINGLE CLIENT BROADCAST
    	//broadcast( message);
    }

    @OnClose
    public void onClose(Session session) {
        // Remove the WebSocket session from the set and broadcast the closure
        sessions.remove(session);
//        broadcast("User disconnected");
    }

    private void broadcast(String message) {
        // Broadcast a message to all connected clients
        for (Session session : sessions) {
            try {
                session.getBasicRemote().sendText(message);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    private void broadcastToOthers(String message, Session senderSession) {
        // Broadcast a message to all connected clients except the sender
        for (Session session : sessions) {
            if (!session.equals(senderSession)) {
                try {
                    session.getBasicRemote().sendText(message);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

}
