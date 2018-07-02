package swing;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;

public class SwingEx_09_DisposeTest extends JFrame {
	public SwingEx_09_DisposeTest() {
		setTitle("MainFrame");
		setBounds(400, 150, 400, 110);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setLayout(null);
		
		JButton btnDispose = new JButton("Dispose");
		btnDispose.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				dispose();
			}
		});
		btnDispose.setBounds(10, 10, 100, 50);
		add(btnDispose);

		JButton btnExit = new JButton("Exit");
		btnExit.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				System.exit(0);
			}
		});
		btnExit.setBounds(120, 10, 100, 50);
		add(btnExit);
		
		JButton btnShow = new JButton("Another Frame");
		btnShow.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				 new SwingEx_09_DisposeTest_Another();
			}
		});
		btnShow.setBounds(230, 10, 140, 50);
		add(btnShow);
		
		setVisible(true);
	}
	
	public static void main(String[] args) {
		new SwingEx_09_DisposeTest();
	}
}






