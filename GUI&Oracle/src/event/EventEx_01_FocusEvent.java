package event;

import java.awt.event.FocusEvent;
import java.awt.event.FocusListener;

import javax.swing.JFrame;

public class EventEx_01_FocusEvent extends JFrame implements FocusListener{

	public EventEx_01_FocusEvent() {
		setBounds(100,100,600,400);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		
		addFocusListener(this);
		
		setVisible(true);
	
	}
	
	public static void main(String[] args) {
		new EventEx_01_FocusEvent();
	}
	
	@Override
	public void focusGained(FocusEvent e) {
		System.out.println("Æ÷Ä¿½º È¹µæ");	
	}

	@Override
	public void focusLost(FocusEvent e) {
		System.out.println("Æ÷Ä¿½º ÀÒÀ½");
	}

	
}
