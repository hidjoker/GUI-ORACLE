package swing;

import java.awt.Dimension;
import java.awt.Point;
import java.awt.Rectangle;

import javax.swing.JButton;
import javax.swing.JFrame;

public class SwingEx_04_Null_LM extends JFrame{

	private SwingEx_04_Null_LM() {
		
		setTitle("Null-LM Example");
		
//		setLocation(100,100);
//		setSize(600,400);
		
		setBounds(100, 100, 600, 400); //위치와 크기를 한번에!
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		
		//null LayoutManager 설정
		setLayout(null);
		
		JButton btn1 = new JButton("버튼1");
		btn1.setLocation(new Point(100, 50));
		btn1.setSize(new Dimension(100, 50));
		add(btn1);
		
		JButton btn2 = new JButton("버튼2");
//		btn2.setBounds(200, 200, 150, 80);
		btn2.setBounds(new Rectangle(120, 80, 150, 80));
		add(btn2);
		
		setVisible(true);
		
	}
	
	public static void main(String[] args) {
		
		new SwingEx_04_Null_LM();
		
	}
	
}
