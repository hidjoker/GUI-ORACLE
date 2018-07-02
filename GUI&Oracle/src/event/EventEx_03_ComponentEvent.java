package event;

import java.awt.event.ComponentEvent;
import java.awt.event.ComponentListener;

import javax.swing.JFrame;

public class EventEx_03_ComponentEvent extends JFrame implements ComponentListener{

	public EventEx_03_ComponentEvent() {
		setBounds(100,100,600,400);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		
		addComponentListener(this);
	
		setVisible(true);
	
	}
	
	public static void main(String[] args) {
		new EventEx_03_ComponentEvent();
	}

	@Override
	public void componentResized(ComponentEvent e) {
		System.out.println("사이즈변경");
	}
	@Override
	public void componentMoved(ComponentEvent e) {
		System.out.println("이동");
	}
	@Override
	public void componentShown(ComponentEvent e) {
		System.out.println("visible : true");
	}
	@Override
	public void componentHidden(ComponentEvent e) {
		System.out.println("visible : false");
	}
	
	
}
