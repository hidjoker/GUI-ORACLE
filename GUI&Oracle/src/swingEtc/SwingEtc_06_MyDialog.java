package swingEtc;

import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class SwingEtc_06_MyDialog extends JDialog 
		implements ActionListener {
	
	private JButton btnOk;
	private JButton btnCancel;
	
	public SwingEtc_06_MyDialog(
			JFrame owner,
			String title,
			boolean modal,
			int x, int y ) {
		
//		 + 모달, Modal
//		  - 윈도우(창)가 새로 열렸을 때 기존의 창을 사용하지 못하도록 하는 방식
//
//		 + 모달리스, Modeless
//		  - 새로운 윈도우가 열려도 기존의 윈도우를 사용할 수 있도록 하는 방식
		
		
		super(owner, title, modal);
		setLocation(x, y);
		
		setLayout(new GridLayout(2, 0));
		
		JLabel message = new JLabel("종료하시겠습니까?",
								JLabel.CENTER);
		add(message);
		
		JPanel pane = new JPanel();

		btnOk = new JButton("확인");
		btnCancel = new JButton("취소");
		
		pane.add(btnOk);
		pane.add(btnCancel);
		
		add(pane);
		pack();
		
		btnOk.addActionListener(this);
		btnCancel.addActionListener(this);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if( e.getSource() == btnOk ) {
			System.exit(0);
		} else if( e.getSource() == btnCancel ) {
			dispose();
		}
	}
}














