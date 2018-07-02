package component_Teacher;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.FocusEvent;
import java.awt.event.FocusListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class ComponentEx extends JFrame {

	public ComponentEx() {
		setBounds(1400, 50, 100, 200);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setLayout(null);
		
		addKeyListener(new KeyAdapter() {
			@Override
			public void keyPressed(KeyEvent e) {
				switch (e.getKeyCode()) {
				case KeyEvent.VK_0:
					System.out.println("0 눌림");
					break;
				
				case KeyEvent.VK_1:	jTextAreaEx(); break;
				case KeyEvent.VK_2:	jTextFieldEx(); break;
				case KeyEvent.VK_3:	jPasswordFieldEx(); break;
				case KeyEvent.VK_4:	jButtonEx(); break;
				
				}
			}
		});
		setVisible(true);
	}
	
	// VK_1
	private void jTextAreaEx() {
		JTextArea txtArea = new JTextArea();
		
		txtArea.setColumns(10); //너비 지정
		txtArea.setRows(20); //높이 지정

		txtArea.setLineWrap(true); //자동 개행
		
		txtArea.setEditable(true); //수정가능여부 설정

		txtArea.setText("안녕하세요");
		
		String str = txtArea.getText();
		System.out.println(str);
		
		newJFrame(txtArea);
	}

	// VK_2
	private void jTextFieldEx() {
		JTextField txt = new JTextField();
		
		txt.setColumns(20); //너비 지정
		
		// --- Placeholder ---
		txt.setText("ID를 입력하세요 :)");
		txt.setForeground(Color.gray);
		
		txt.addFocusListener(new FocusListener() {
			@Override
			public void focusLost(FocusEvent e) {
				// JTextField에서 포커스를 잃으면 Placeholder
				if( txt.getText().isEmpty() ) {
					txt.setText("ID를 입력하세요 :)");
					txt.setForeground(Color.gray);
				}
			}
			
			@Override
			public void focusGained(FocusEvent e) {
				// JTextField에 포커스가 넘어가면 텍스트 지우기
				if( txt.getText().equals("ID를 입력하세요 :)")) {
					txt.setText("");
					txt.setForeground(Color.BLACK);
				}
			}
		});
		// ---------------------
		
		JPanel pane = new JPanel();
		pane.add(txt);
		
		JButton btn = new JButton("하하ㅎ");
		pane.add(btn);
		
//		newJFrame(txt);
		newJFrame(pane);

		// 화면을 띄우는 newJFrame() 메소드 이후에 호출해야 함
		btn.requestFocus(); // 버튼이 포커스 획득하게 만듦
	}
	
	// VK_3
	private void jPasswordFieldEx() {
		JPasswordField pass = new JPasswordField("TEST",20);
		
//		System.out.println(pass.getText()); // deprecated
		System.out.println(pass.getPassword());
		
		newJFrame(pass);
	}
	
	// VK_4
	private void jButtonEx() {
		JButton btn = new JButton("버튼");
		
		btn.setToolTipText("전송합니다 ");
		
		btn.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println("Button Clicked!!");
			}
		});
		
		btn.setPreferredSize(new Dimension(300, 400));
		
		btn.doClick();
		btn.doClick();
		btn.doClick();
		btn.doClick();
		btn.doClick();
		btn.doClick();
		
		newJFrame(btn);
	}
	
	private void newJFrame(JComponent c) {
		JFrame frame = new JFrame("컴포넌트 테스트");
		frame.setBounds(1500,60,500,500);
		frame.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		
		// 이미지 파일 객체
		ImageIcon img = new ImageIcon(
				"./src/component/mi.jpg");
		
		JPanel panel = new JPanel() {
			@Override
			protected void paintComponent(Graphics g) {
				g.drawImage(img.getImage(),
						0, 0,
						getSize().width, getSize().height,
						null);
				
				setOpaque(false);

				super.paintComponent(g);
			}
		};
		
		
//		JPanel pane = new JPanel();
//		pane.add(c);
//		frame.getContentPane().add(pane);
		
		panel.add(c);
		frame.getContentPane().add(panel);
		
		frame.setVisible(true);		
	}

	public static void main(String[] args) {
		new ComponentEx();
	}
}












