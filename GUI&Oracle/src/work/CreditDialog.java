package work;

import java.awt.Color;
import java.awt.Font;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextArea;

public class CreditDialog extends JDialog {

	//컴포넌트 필드
	JLabel lblPhoto = null;
	JButton btnClose = null;
	JTextArea txtContent = null;
	
	public CreditDialog(JFrame frame,String title,boolean modal,int x, int y) {
		
		//다이얼로그 설정
		super(frame,title,modal);
		setLocation(x, y);
		setLayout(null);
		setSize(800, 500);
		
		//txtContent 설정
		txtContent = new JTextArea();
		txtContent.setBounds(10, 10, 360, 420);
		txtContent.setFont(new Font("고딕",Font.BOLD,16));
		txtContent.setEditable(false);
		txtContent.setLineWrap(true);
		txtContent.setBackground(new Color(238, 238, 238));
		
		String txt = "\t<제작자 소개>\r\n" + 
				"\r\n" + 
				"        3조 - Mini Project\r\n" + 
				"        팀명 : 답답한 남매들\r\n" + 
				"\r\n" + 
				"        정지훈 - jihoonys82@gmail.com \r\n" + 
				"        권미현 - kwon_mi_hyun@naver.com\r\n" + 
				"        송주현 - ccolog531@gmail.com\r\n" + 
				"        배창환 - sindy6639@naver.com\r\n" + 
				"        이현우 - hidjoker@naver.com\r\n" + 
				"        특별도움 - 송영준\r\n" + 
				"\r\n" + 
				"                   <미니 프로젝트 깃 주소>\r\n" + 
				"\r\n"+
				"  https://github.com/jihoonys82/javaMiniProj\r\n";
		txtContent.setText(txt);
		
		//lblPhoto 설정
		lblPhoto = new JLabel(new ImageIcon("./photo/credit.jpg"));
		lblPhoto.setBounds(370, 30, 400, 300);
		
		//btnClose 설정
		btnClose = new JButton("닫기");
		btnClose.setBounds(660, 360, 100, 50);
		
		add(txtContent);
		add(lblPhoto);
		add(btnClose);
		
	}
	
}
