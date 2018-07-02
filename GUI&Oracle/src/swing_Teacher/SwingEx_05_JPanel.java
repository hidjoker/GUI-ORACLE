package swing_Teacher;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class SwingEx_05_JPanel extends JFrame {
	private SwingEx_05_JPanel() {
		setTitle("JPanel Example");
		setBounds(1400, 50, 600, 400); //위치와 크기를 한번에! 
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		
		JPanel pane1 = new JPanel();
		
		pane1.add(new JButton("버튼1"));
		pane1.add(new JButton("버튼2"));
		pane1.add(new JButton("버튼3"));
		
		add(pane1);
		
		setVisible(true);
	}
	
	public static void main(String[] args) {
		new SwingEx_05_JPanel();
	}
	
}





