package component;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Graphics;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.FocusEvent;
import java.awt.event.FocusListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import javax.swing.ButtonGroup;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JRadioButton;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.ListSelectionModel;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

public class ComponentEx extends JFrame{
	
	public ComponentEx() {
		setBounds(100,100,100,200);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		getContentPane().setLayout(null);
		
		addKeyListener(new KeyAdapter() {
			@Override
			public void keyPressed(KeyEvent e) {
				switch(e.getKeyCode()) {
				case KeyEvent.VK_0 :
					System.out.println("0눌림"); break;
				case KeyEvent.VK_1: jTextAreaEx(); break;
				case KeyEvent.VK_2: jTextFieldEx(); break;
				case KeyEvent.VK_3: jPasswordField();break;
				case KeyEvent.VK_4: jButtonEx(); break;
				case KeyEvent.VK_5: jCheckBoxEx(); break;
				case KeyEvent.VK_6: jRadioButtonEx(); break;
				case KeyEvent.VK_7: jListEx(); break;
				case KeyEvent.VK_8: jComboBoxEx(); break;
			    }
		    }
			
	    });
		setVisible(true);
    }
	
	
	private void newJFrame(JComponent c) {
		JFrame frame = new JFrame("컴포넌트 테스트");
		frame.setBounds(200, 150, 500, 500);
		frame.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		
		ImageIcon img = new ImageIcon("./src/component/mi.jpg");
		JPanel panel = new JPanel() { 
			//익명객체 생성과 동시에 자동으로 매소드 호출
			@Override
			protected void paintComponent(Graphics g) {
				
				g.drawImage(img.getImage(), 0, 0, getSize().width, getSize().height, null);
				
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

	
	//VK_8
	private void jComboBoxEx() {
		
		String[] data = {"신라면", "진라면", "오징어짬뽕", "왕뚜껑"};
		JComboBox<String> combo = new JComboBox<>(data);
		
		JTextField txt = new JTextField();
		txt.setColumns(20);
		txt.setEditable(true);
		txt.setBackground(Color.white);
		txt.setForeground(Color.BLACK);


		
		
		combo.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				
				if(combo.getSelectedItem().equals("신라면")) {
					txt.setText("신라면");
				}
				
				if(combo.getSelectedItem().equals("진라면")) {
					txt.setText("진라면");
				}
				
				if(combo.getSelectedItem().equals("오징어짬뽕")) {
					txt.setText("오징어짬뽕");
				}
				
				if(combo.getSelectedItem().equals("왕뚜껑")) {
					txt.setText("왕뚜껑");
				}
				
				
			}
		});
		
		txt.addKeyListener(new KeyListener() {
			
			@Override
			public void keyTyped(KeyEvent e) {
				
			}
			
			@Override
			public void keyReleased(KeyEvent e) {
				
			}
			
			@Override
			public void keyPressed(KeyEvent e) {
				if(e.getKeyCode() == KeyEvent.VK_ENTER) {
					String str = txt.getText();
					if(combo.getSelectedIndex()==0) {
						combo.removeItemAt(0);
						combo.insertItemAt(str, 0);
						combo.setSelectedIndex(0);
						validate();
						repaint();
					}
					if(combo.getSelectedIndex()==1) {
						data[1] = txt.getText()+str;
						combo.removeItemAt(1);
						combo.insertItemAt(str, 1);
						combo.setSelectedIndex(1);
						validate();
						repaint();
					}
					if(combo.getSelectedIndex()==2) {
						data[2] = txt.getText()+str;
						combo.removeItemAt(2);
						combo.insertItemAt(str, 2);
						combo.setSelectedIndex(2);
						validate();
						repaint();
					}
					if(combo.getSelectedIndex()==3) {
						data[3] = txt.getText()+str;
						combo.removeItemAt(3);
						combo.insertItemAt(str, 3);
						combo.setSelectedIndex(3);
						validate();
						repaint();
					}
					txt.setText("");
				}
			}
		});
		
		JPanel paneSub = new JPanel();
		paneSub.add(combo);
		
		JPanel panel = new JPanel();
		panel.setLayout(new GridLayout(2, 0));
		panel.add(paneSub);
		panel.add(txt);
		
		newJFrame(panel);
		
	}
	
	//VK_7
	private void jListEx() {
		//JList 객체
		String[] data = {"신라면","진라면","오징어짬뽕","왕뚜껑"};
		JList<String> list = new JList<>(data);
		list.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		
		//텍스트 필드
		JTextField txt = new JTextField();
		txt.setColumns(20);
		txt.setEditable(false);
		txt.setBackground(Color.white);
		txt.setForeground(Color.BLACK);
		
		//리스너
		list.addListSelectionListener(new ListSelectionListener() {
			
			@Override
			public void valueChanged(ListSelectionEvent e) {
				if(list.getSelectedValue().equals("신라면")) {
					txt.setText("신라면");
				}
				if(list.getSelectedValue().equals("진라면")) {
					txt.setText("진라면");
				}
				if(list.getSelectedValue().equals("오징어짬뽕")) {
					txt.setText("오징어짬뽕");
				}
				if(list.getSelectedValue().equals("왕뚜껑")) {
					txt.setText("왕뚜껑");
				}
				
			}
		});
		
		//판넬
		JPanel paneSub = new JPanel();
		paneSub.add(list);
		JPanel panel = new JPanel();
		panel.setLayout(new GridLayout(2, 0));
		panel.add(paneSub);
		panel.add(txt);
	
		newJFrame(panel);
		
	}
	
	//VK_6
	private void jRadioButtonEx() {
		
		//버튼
		JRadioButton iceA = new JRadioButton("아이스 아메리카노");
		JRadioButton wmJ = new JRadioButton("수박주스");
		JRadioButton iceC = new JRadioButton("아이스 초코");
		
		//텍스트
		JTextField txt = new JTextField();
		txt.setEditable(false);
		txt.setColumns(20);
		txt.setBackground(Color.white);
		txt.setForeground(Color.black);
		
		//리스너
        iceA.addActionListener(new ActionListener() {	
			@Override
			public void actionPerformed(ActionEvent e) {
				txt.setText("아이스 아메리카노");
			}
		});
		wmJ.addItemListener(new ItemListener() {	
			@Override
			public void itemStateChanged(ItemEvent e) {
				txt.setText("수박주스");
			}
		});
		iceC.addItemListener(new ItemListener() {	
			@Override
			public void itemStateChanged(ItemEvent e) {
				txt.setText("아이스 초코");
			}
		});

		
		JPanel paneSub = new JPanel();
		paneSub.add(iceA);
		paneSub.add(wmJ);
		paneSub.add(iceC);
		
		JPanel panel = new JPanel();
		panel.setLayout(new GridLayout(2, 0));
		panel.add(paneSub);
		panel.add(txt);
		
		newJFrame(panel);
		
	}
	
	
	
	//VK_5
	private void jCheckBoxEx() {
		//버튼
		JCheckBox iceA = new JCheckBox("아이스 아메리카노");
		JCheckBox wmJ = new JCheckBox("수박주스");
		JCheckBox iceC = new JCheckBox("아이스 초코");
		iceA.setSelected(false);
		wmJ.setSelected(false);
		iceC.setSelected(false);
		
		//텍스트필드
		JTextField txt = new JTextField();
		txt.setEditable(false);
		txt.setBackground(Color.white);
		txt.setForeground(Color.BLACK);
		txt.setColumns(20);
		
		//액션 리스너
        iceA.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				txt.setText("아이스 아메리카노");				
			}
		});
		wmJ.addItemListener(new ItemListener() {	
			@Override
			public void itemStateChanged(ItemEvent e) {
				txt.setText("수박주스");				
			}
		});
		iceC.addItemListener(new ItemListener() {	
			@Override
			public void itemStateChanged(ItemEvent e) {
				txt.setText("아이스 초코");				
			}
		});
		

		
		JPanel paneSub = new JPanel();
		paneSub.add(iceA);
		paneSub.add(wmJ);
		paneSub.add(iceC);
	
		JPanel panel = new JPanel();
		panel.setLayout(new GridLayout(2, 0));
		panel.add(paneSub);
		panel.add(txt);
		
		newJFrame(panel);
		
	}
	
	//VK_4
	private void jButtonEx() {
		JButton btn = new JButton("버튼");
		btn.setToolTipText("전송합니다");
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
	
	//VK_3
	private void jPasswordField() {
		JPasswordField pass = new JPasswordField("TEST",20);
		
//		System.out.println(pass.getText()); //deprecated 이젠 사용안하는 메소드
		System.out.println(pass.getPassword());
		
		newJFrame(pass);
		
	}
	
	//VK_2
	private void jTextFieldEx() {
		JTextField txt = new JTextField();
		
		txt.setColumns(20); //너비 지정
		
		//------Placeholder--------
		
		txt.setText("ID를 입력하세요 :)");
		txt.setForeground(Color.GRAY);
		txt.addFocusListener(new FocusListener() {
			
			@Override
			public void focusLost(FocusEvent e) {
				// JTextField에서 포커스를 잃으면 Placeholder
				if(txt.getText().isEmpty()) {
				txt.setText("ID를 입력하세요 :)");
				txt.setForeground(Color.GRAY);
				}
				
			}
			
			@Override
			public void focusGained(FocusEvent e) {
				//JTextField에 포커스가 넘어가면 텍스트 지우기
				if(txt.getText().equals("ID를 입력하세요 :)")) {
				txt.setText("");
				txt.setForeground(Color.black);
				}
			}
		});
		//------------------------------
		JPanel pane = new JPanel();
		pane.add(txt);
		
		JButton btn = new JButton("하하ㅎ");
		pane.add(btn);
		
//		newJFrame(txt);
		newJFrame(pane);
		
		// 화면을 띄우는  newJFrame() 메소드 이후에 호출해야 함
		btn.requestFocus(); // 버튼이 포커스 획득하게 만듦

		
		}
	//VK_1	
	private void jTextAreaEx() {
		JTextArea txtArea = new JTextArea();
		txtArea.setColumns(10); //너비 지정
		txtArea.setRows(20); //높이 지정
		
		txtArea.setLineWrap(true); //자동 개행
		
		txtArea.setEditable(false); //수정가능여부 설정
		txtArea.setText("안녕하세요");
		String str = txtArea.getText();
		System.out.println(str);
		
		newJFrame(txtArea);
	}
	public static void main(String[] args) {
		new ComponentEx();
	}
	
}
