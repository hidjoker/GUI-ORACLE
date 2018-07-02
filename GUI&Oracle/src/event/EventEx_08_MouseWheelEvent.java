package event;

import java.awt.event.MouseEvent;
import java.awt.event.MouseWheelEvent;
import java.awt.event.MouseWheelListener;

import javax.swing.JFrame;

public class EventEx_08_MouseWheelEvent extends JFrame implements MouseWheelListener{

	
	public EventEx_08_MouseWheelEvent() {
		setBounds(100,100,600,400);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		
		addMouseWheelListener(this);
		
		setVisible(true);
	
	}


	public static void main(String[] args) {
		new EventEx_08_MouseWheelEvent();
	}


	@Override
	public void mouseWheelMoved(MouseWheelEvent e) {
		System.out.println(e.getWheelRotation());
		
	}

}
