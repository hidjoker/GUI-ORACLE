package swing;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;

public class SwingEx_09_DisposeTest_Another
	extends JFrame {

	public SwingEx_09_DisposeTest_Another() {
		setTitle("Another Frame");
		setBounds(100, 100, 245, 110);
		setLayout(null);
		setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		
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
		
		setVisible(true);
	}
}












