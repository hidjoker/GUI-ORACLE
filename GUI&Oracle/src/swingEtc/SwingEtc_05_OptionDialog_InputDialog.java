package swingEtc;

import java.awt.Container;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

public class SwingEtc_05_OptionDialog_InputDialog
		extends JFrame 
		implements ActionListener {

	private JPanel pane;
	
	private JButton optionBtn;
	private JButton inputBtn; 
	
	private SwingEtc_05_OptionDialog_InputDialog() {
		setBounds(100, 100, 300, 300);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		
		pane = new JPanel();
		pane.setLayout(new GridLayout(2, 0, 0, 20));
		
		optionBtn = new JButton("옵션");
		optionBtn.addActionListener(this);
		inputBtn = new JButton("입력");
		inputBtn.addActionListener(this);
		
		pane.add(optionBtn);
		pane.add(inputBtn);
		
		Container root = getContentPane();
		root.add(pane);
		
		setVisible(true);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		if( e.getSource() == optionBtn ) {
			
			Object[] options = {"옵션1","옵션2","옵션3"};
			
			int selected = JOptionPane.showOptionDialog(
				pane, // parent
				"옵션 다이얼로그", // message
				"Option", // title
				JOptionPane.YES_NO_CANCEL_OPTION,//option
				JOptionPane.QUESTION_MESSAGE,//messageType
				null,//icon
				options, // 옵션들
				options[0]); // 옵션중 focus 지정값
			
			optionBtn.setText(selected + ":선택");
//			optionBtn.setText((String)options[selected]);
			
		} else if ( e.getSource() == inputBtn ) {
			Object[] inputs = {"입력1", "입력2", "입력3"};
			
			String msg=(String)JOptionPane.showInputDialog(
					pane, //parent
					"입력 다이얼로그", //message
					"Input", //title
					JOptionPane.PLAIN_MESSAGE, //messageType
					null, //icon
					inputs, //selectionValues
					inputs[0]); //initialSelectionValue
			inputBtn.setText("선택! " + msg);
		}
	}

	public static void main(String[] args) {
		new SwingEtc_05_OptionDialog_InputDialog();
	}
}











