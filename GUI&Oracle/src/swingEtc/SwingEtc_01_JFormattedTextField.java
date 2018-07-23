package swingEtc;

import java.awt.Container;
import java.text.ParseException;

import javax.swing.JFormattedTextField;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.text.MaskFormatter;

public class SwingEtc_01_JFormattedTextField extends JFrame {
	private Container root;
	
	private SwingEtc_01_JFormattedTextField() {
		setBounds(100, 100, 300, 200);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		
		root = getContentPane();
		JPanel pane = new JPanel();
		
		// 컴포넌트 생성, 추가
		MaskFormatter format = null;
		try {
//			format = new MaskFormatter("###.###.###.###");
//			format = new MaskFormatter("192.168.20.###");
			format = new MaskFormatter("AAAAAAAA");
//			format = new MaskFormatter("UUUUU");
//			format = new MaskFormatter("01#-####-####");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		JFormattedTextField txt;
		txt = new JFormattedTextField(format);
		txt.setColumns(20);
		pane.add(txt);
		
		root.add(pane);
		setVisible(true);
	}
	
	public static void main(String[] args) {
		new SwingEtc_01_JFormattedTextField();
	}
}






