package swing;

import java.awt.Button;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class SwingEx_02_MyFrame extends JFrame{

	//레이블
	private JLabel lbl;
	
	//버튼 3개
	private Button btn1;
	private JButton btn2;
	private JButton btn3;
	
	
	
	private SwingEx_02_MyFrame() {
		// 제목표시줄 설정
		setTitle("GUI Program");
		
		setLocation(100, 100); //위치 설정
		setSize(500, 500); //크기 설정
		
		setDefaultCloseOperation(EXIT_ON_CLOSE); //닫기 설정
		
		setLayout(new GridLayout(2,2)); //배치관리자 설정
		
		initFrame(); //컴포넌트 설정
		initEvent(); //이벤트 설정
		
		//ctrl+shift+ - 화면 세로 분할
		//ctrl+shift+[  화면 가로 분할
		
		setVisible(true); //보이기 설정
		
	}
	
	private void initFrame() {
		//레이블 1개, 버튼 3개
		lbl = new JLabel("레이블");
		lbl.setHorizontalAlignment(JLabel.CENTER);
		
		btn1 = new Button("버튼1");
		btn2 = new JButton("버튼2");
		btn3 = new JButton("버튼3");
		
		add(btn1);
		add(btn2);
		add(btn3);
		add(lbl);
		
	}
		
	private void initEvent() {
	
		btn1.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				lbl.setText("");
				
			}
		});
		
		// 버튼이 눌리면 레이블에 텍스트가 보이도록 작성
		
		// btn2 -> 버튼2에요!!
		btn2.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				lbl.setText("버튼2에요!!");
				
			}
		});
		
		// btn3 -> 버튼3에요!!
		btn3.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				lbl.setText("버튼3에요!!");
				
			}
		});
		
	}



	public static void main(String[] args) {
		new SwingEx_02_MyFrame(); //프레임 생성
		
	}
}
