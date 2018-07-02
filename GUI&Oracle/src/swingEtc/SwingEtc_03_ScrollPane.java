package swingEtc;

import java.awt.Container;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

public class SwingEtc_03_ScrollPane extends JFrame {
	private SwingEtc_03_ScrollPane() {
		setBounds(100, 100, 400, 400);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		
		// JScrollPane
		JTextArea area = new JTextArea();
		
		JScrollPane scroll;
		scroll = new JScrollPane(
				area,
				JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
				JScrollPane.HORIZONTAL_SCROLLBAR_ALWAYS);
		
		Container root = getContentPane();
		root.add(scroll);
		
		setVisible(true);
	}
	
	public static void main(String[] args) {
		new SwingEtc_03_ScrollPane();
	}
}






