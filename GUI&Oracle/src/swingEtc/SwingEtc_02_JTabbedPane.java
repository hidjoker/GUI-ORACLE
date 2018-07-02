package swingEtc;

import java.awt.Container;
import java.awt.Dimension;
import java.awt.Graphics;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;

public class SwingEtc_02_JTabbedPane extends JFrame {

	private SwingEtc_02_JTabbedPane() {
		setBounds(100, 100, 400, 400);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		
		JPanel pane1 = new JPanel();
		JPanel pane2 = new JPanel();
		JPanel pane3 = new JPanel();
		
		JLabel img = new JLabel(
				new ImageIcon("./src/swingEtc/mi.jpg"));

		pane1.add(new JButton("첫번째 판넬"));
		pane2.add(new JButton("두번째 판넬"));
//		pane3.add(new JButton("세번째 판넬"));
		pane3.add(img);
		
		JTabbedPane tabPane = new JTabbedPane();
		tabPane.add(pane1, "First");
		tabPane.add(pane2, "Second");
		tabPane.add(pane3, "Third");
		
//		tabPane.setTabPlacement(JTabbedPane.LEFT);
//		tabPane.setTabPlacement(JTabbedPane.RIGHT);
//		tabPane.setTabPlacement(JTabbedPane.TOP); // 기본
		tabPane.setTabPlacement(JTabbedPane.BOTTOM);
		
		Container root = getContentPane();
		root.add(tabPane);
		
		setVisible(true);
	}
	
	public static void main(String[] args) {
		new SwingEtc_02_JTabbedPane();
	}
}






