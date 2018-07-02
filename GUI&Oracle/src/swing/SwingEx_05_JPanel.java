package swing;

import java.awt.Dimension;
import java.awt.Point;
import java.awt.Rectangle;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class SwingEx_05_JPanel extends JFrame{
	
private SwingEx_05_JPanel() {
		
		setTitle("JPanel Example");
		
		setBounds(100, 100, 600, 400); //위치와 크기를 한번에!
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		
		JPanel panel = new JPanel();
		
		panel.add(new JButton("버튼1"));
		panel.add(new JButton("버튼2"));
		panel.add(new JButton("버튼3"));
		
		add(panel);
		
		setVisible(true);
		
	}
	
	public static void main(String[] args) {
		
		new SwingEx_05_JPanel();
		
	}
}
