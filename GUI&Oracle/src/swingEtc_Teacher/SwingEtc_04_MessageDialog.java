package swingEtc_Teacher;

import java.awt.Container;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

public class SwingEtc_04_MessageDialog
		extends JFrame
		implements ActionListener{
	
	private JPanel pane;

	private JButton questionBtn;
	private JButton informationBtn;
	private JButton warningBtn;
	private JButton errorBtn;
	
	private SwingEtc_04_MessageDialog() {
		setBounds(1400, 50, 300, 300);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		
		Container root = getContentPane();
		
		pane = new JPanel();
		pane.setLayout(new GridLayout(4, 0, 0, 20));
		
		questionBtn = new JButton("질문");
		questionBtn.addActionListener(this);
		informationBtn = new JButton("정보");
		informationBtn.addActionListener(this);
		warningBtn = new JButton("경고");
		warningBtn.addActionListener(this);
		errorBtn = new JButton("에러");
		errorBtn.addActionListener(this);
		
		pane.add(questionBtn);
		pane.add(informationBtn);
		pane.add(warningBtn);
		pane.add(errorBtn);
		
		root.add(pane);
		
		setVisible(true);
	}

	public static void main(String[] args) {
		new SwingEtc_04_MessageDialog();
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if( e.getSource() == questionBtn ) {
			JOptionPane.showMessageDialog(
					pane,
					"질문 대화상자",
					"Question",
					JOptionPane.QUESTION_MESSAGE);
		} else if( e.getSource() == informationBtn ) {
			JOptionPane.showMessageDialog(
					pane,
					"정보 대화상자",
					"Information",
					JOptionPane.INFORMATION_MESSAGE);
		} else if( e.getSource() == warningBtn ) {
			JOptionPane.showMessageDialog(
					pane,
					"경고 대화상자",
					"Warning",
					JOptionPane.WARNING_MESSAGE);
		} else if( e.getSource() == errorBtn ) {
			JOptionPane.showMessageDialog(
					pane,
					"에러 대화상자",
					"Error",
					JOptionPane.ERROR_MESSAGE);
		}

	}
}
