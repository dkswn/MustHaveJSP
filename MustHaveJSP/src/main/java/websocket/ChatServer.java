package websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/ChatingServer")
public class ChatServer {
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnOpen
	public void onOpen(Session session) {
		clients.add(session);
		System.out.println("웹소켓 연결 : " + session.getId());
	}
	
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println("메시지 전송 : " + session.getId() + ":" + message);
		synchronized (clients) {
			for(Session client : clients) {	// 모든 클라이언트에 메시지 전달
				if(!client.equals(session)) {
					// 단, 메시지를 보낸 클라이언트는 제외하고 전달
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}
	
	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
		System.out.println("웹소켓 종료 : " + session.getId());
	}
	
	@OnError
	public void onError(Throwable e) {
		System.out.println("에러 발생");
		e.printStackTrace();
	}
}
