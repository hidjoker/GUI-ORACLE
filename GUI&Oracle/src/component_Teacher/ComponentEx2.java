package component_Teacher;


import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.FocusEvent;
import java.awt.event.FocusListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.io.IOException;
import java.util.Vector;

import javax.swing.BorderFactory;
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
import javax.swing.JTextPane;
import javax.swing.ListSelectionModel;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.text.BadLocationException;
import javax.swing.text.html.HTMLDocument;

public class ComponentEx2 extends JFrame {
	public ComponentEx2() {
		setBounds(1400, 50, 100, 200);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		
		setLayout(null);
		
		addKeyListener(new KeyAdapter() {
			@Override
			public void keyPressed(KeyEvent e) {
				switch(e.getKeyCode()) {
				case KeyEvent.VK_0:
					System.out.println("0 눌림");
					break;
					
				case KeyEvent.VK_1:	jTextAreaEx(); break;

				case KeyEvent.VK_2:	jTextFieldEx(); break;

				case KeyEvent.VK_3:	jPasswordFieldEx(); break;

				case KeyEvent.VK_4:	jButtonEx(); break;

				case KeyEvent.VK_5:	jCheckBoxEx(); break;

				case KeyEvent.VK_6:	jRadioButtonEx(); break;
				
				case KeyEvent.VK_7:	jListEx(); break;
				
				case KeyEvent.VK_8:	jComboBoxEx(); break;
				}
			}
		});
		
		setVisible(true);
	}
	
	// 1
	HTMLDocument html;
	JTextPane txtPane;
	private void jTextAreaEx() {
		JTextArea txtArea = new JTextArea();
		txtArea.setColumns(10);
		txtArea.setRows(20);

		txtArea.setLineWrap(true);

		// 텍스트 판넬
		txtPane = new JTextPane();
		txtPane.setContentType("text/html");	// html 인식되도록 설정
		txtPane.setPreferredSize(new Dimension(200, 100));	// 사이즈 지정, 다른 방식으로 해도됨
		txtPane.setEditable(false);	// 수정 불가
		
		// 텍스트 넣기
		txtPane.setText("");
		
		// 텍스트 집어넣는 메소드
		setText();
		
		newJFrame(txtPane);
	}

	private void setText() {
		// HTML문서를 인식할 수 있도록 HTMLDocument 객체 얻어오기 
		html = (HTMLDocument) txtPane.getStyledDocument();
		
		try {
			// insertAfterEnd() 메소드 -> 마지막에 추가하는 메소드
			
			html.insertAfterEnd(
					html.getCharacterElement(html.getLength()), 
					"<font color=\"red\">안녕하세요<br></font>");

			html.insertAfterEnd(
					html.getCharacterElement(html.getLength()), 
					"<font color=\"blue\">반가워요<br></font>");

			html.insertAfterEnd(
					html.getCharacterElement(html.getLength()), 
					"<font color=\"orange\">잘가요<br></font>");
			
		} catch (BadLocationException | IOException e1) {
			e1.printStackTrace();
		}
	}
	
	// 2
	private void jTextFieldEx() {
		JTextField txt = new JTextField();
		txt.setColumns(20);

		JTextField t = new  JTextField();
		t.setColumns(20);
		
		// Placeholder 만들기
		txt.setText("ID를 입력하세요");
		txt.setForeground(Color.gray);
		
		// Placeholder 조절
		txt.addFocusListener(new FocusListener() {
			@Override
			public void focusLost(FocusEvent e) {
				
				// 빈 JTextField에 Placeholder 보이기
				if(txt.getText().isEmpty()){
					txt.setText("ID를 입력하세요");
					txt.setForeground(Color.gray);
				}
			}
			
			@Override
			public void focusGained(FocusEvent e) {

				// JTextField에 포커스가 가면 Placeholder없애기
				if(txt.getText().equals("ID를 입력하세요")){
					txt.setText("");
					txt.setForeground(Color.black);
				}
			}
		});
		
		JPanel pane = new JPanel();
		
		pane.add(txt);
		JButton btn = new JButton("T-T");
		pane.add(btn);

		newJFrame(pane);

		// 버튼에 Focus 얻기
		// JFrame이 생성된 이후에 Focus를 옳겨야해서
		// newJFrame(pane); 호출 뒤에서 작동시킴
		btn.requestFocus();
	}
	
	//3
	public void jPasswordFieldEx() {
		JPasswordField pass = new JPasswordField("test", 20);
		
		System.out.println( pass.getPassword() );
		
		newJFrame(pass);
	}
	
	//4
	public void jButtonEx() {
		JButton btn = new JButton("버튼");

//		btn.setEnabled(false);
		btn.setToolTipText("전송합니다");
		
		btn.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println("Button Clicked");
			}
		});
		
//		btn.setPreferredSize(new Dimension(300, 400));
		
		btn.doClick();
		
		newJFrame(btn);
	}
	
	// 5
	private void jCheckBoxEx() {
		// 아이스 아메리카노, 수박주스, 아이스 초코
		// 선택하면 CheckBox의 JTextField에 출력
		
		// 선택할 때 발생하는 이벤트는 무엇???

		JPanel pane = new JPanel();
		pane.setLayout(new BorderLayout());
		
		JPanel checkPane = new JPanel();
		JCheckBox check1 = new JCheckBox("아이스 아메리카노");
		JCheckBox check2 = new JCheckBox("수박주스");
		JCheckBox check3 = new JCheckBox("아이스 초코");

		JTextField txt = new JTextField();

		// ItemEvent -> ItemListener
		// itemStateChanged() 메소드
		
		ItemListener li = new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e) {
				
				// JCheckBox객체.isSelected() 메소드
				// e.getStatechange() == ItemEvent.SELECTED
				
				// JCheckBox객체.getText()
				
				if(e.getSource() == check1 && check1.isSelected()) {
					txt.setText(check1.getText());
				} else if(e.getSource() == check2
						&& e.getStateChange() == ItemEvent.SELECTED) {
					txt.setText(check2.getText());
				} else if(e.getSource() == check3 && check3.isSelected()) {
					txt.setText(check3.getText());
				}
			}
		};
		
		check1.addItemListener(li);
		check2.addItemListener(li);
//		check3.addItemListener(li);
		
		check3.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				if(e.getSource() == check3 && check3.isSelected())
					txt.setText(check3.getText());
			}
		});
		
		checkPane.add(check1);
		checkPane.add(check2);
		checkPane.add(check3);

		pane.add(checkPane, "Center");
		pane.add(txt, "South");
		
		newJFrame(pane);
	}
	
	//6
	private void jRadioButtonEx() {
		// 아이스 아메리카노, 수박주스, 아이스초코
		// 선택하면 Radiobutton의 텍스트를 JTextField
		// 선택할 때 발생하는 이벤트는 무엇???
		// 잘 안되면 ButtonGroup Class 찾아보기

		JPanel pane = new JPanel();
		pane.setLayout(new BorderLayout());
		
		JPanel radioPane = new JPanel();
		JRadioButton radio1 = new JRadioButton("아이스 아메리카노");
		JRadioButton radio2 = new JRadioButton("수박주스");
		JRadioButton radio3 = new JRadioButton("아이스 초코");
		
		// ButtonGroup 으로 묶지 않으면
		// JRadioButton이 개별적으로 On/Off 로 처리됨
//		ButtonGroup bg = new ButtonGroup();
//		bg.add(radio1);
//		bg.add(radio2);
//		bg.add(radio3);

		JTextField txt = new JTextField();

		// ItemEvent -> ItemLisenter
		// itemStateChanged() 메소드
		
		ItemListener li = new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e) {
				if(e.getSource() == radio1) {
					txt.setText(radio1.getText());
				} else if(e.getSource() == radio2) {
					txt.setText(radio2.getText());
				} else if(e.getSource() == radio3) {
					txt.setText(radio3.getText());
				} 
			}
		};
		
		radio1.addItemListener(li);
		radio2.addItemListener(li);
		radio3.addItemListener(li);
		
		radioPane.add(radio1);
		radioPane.add(radio2);
		radioPane.add(radio3);

		
		// JPanel에 Border(테두리) 씌우기
		radioPane.setBorder(BorderFactory.createLineBorder(Color.BLUE));
		
		pane.add(radioPane, "Center");
		pane.add(txt, "South");
		
		newJFrame(pane);
	}
	
	// 7
	private void jListEx() {
		// 신라면, 진라면, 오징어짬뽕, 왕뚜껑
		// 선택한 List Item의 텍스트를 콘솔에 출력
		// 선택할 때 발생하는 이벤트는 무엇???

		JPanel pane = new JPanel();
		pane.setLayout(new BorderLayout());

		Vector<String> v = new Vector<String>();
		v.add("신라면");
		v.add("진라면");
		v.add("오징어짬뽕");
		v.add("왕뚜껑");

		// JList 의 listData를 Vector로 넣기
		JList<String> list = new JList<String>(v);
//		JList<String> list = new JList<String>();
//		list.setListData(v);
		
		// JList의 선택모드 정하기
		// shift 나 ctrl 을 누르고 선택했을 때 동작이 달라짐
		
		// 무조건 하나만 선택 가능
		list.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		
		// 연속적인 Item으로 선택
//		list.setSelectionMode(ListSelectionModel.SINGLE_INTERVAL_SELECTION);
		
		// 떨어져있는 Item도 선택 (기본값)
//		list.setSelectionMode(ListSelectionModel.MULTIPLE_INTERVAL_SELECTION);
		
		JTextField txt = new JTextField();

		// ListSelectionEvent -> ListSelectionListener
		// valueChanged() 메소드
		
		ListSelectionListener li = new ListSelectionListener() {
			@Override
			public void valueChanged(ListSelectionEvent e) {
				
				// 2개의 메시지가 뜨지만 isAdjusting 상태가 다르다
//				System.out.println(e);
				
				if(e.getSource() == list && e.getValueIsAdjusting()) {
					txt.setText(list.getSelectedValue());
					System.out.println(list.getSelectedValue());
				}
			}
		};
		
		list.addListSelectionListener(li);

		pane.add(list, BorderLayout.CENTER);
		pane.add(txt, BorderLayout.SOUTH);
		
		newJFrame(pane);
	}
	
	// 8
	private void jComboBoxEx() {
		// 신라면, 진라면, 오징어짬뽕, 왕뚜껑
		// 선택한 List Item의 텍스트를 콘솔에 출력
		// 선택할 때 발생하는 이벤트는 무엇???
		// 콤보박스의 아이템을 수정해보기, 수정하고 엔터 입력 시 이벤트 발생???

		JPanel pane = new JPanel();
		pane.setLayout(new BorderLayout());

		Vector<String> v = new Vector<String>();
		v.add("신라면");
		v.add("진라면");
		v.add("오징어짬뽕");
		v.add("왕뚜껑");

		// Vector로 Item 넣기
		JComboBox<String> combo = new JComboBox<>(v);
		
		JTextField txt = new JTextField();
		
		// 수정가능 모드 (기본값 : false)
		combo.setEditable(true);
		
		// ActionEvent -> ActionListener
		// actionPerformed() 메소드
		
		ActionListener li = new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				
				// JComboBox객체.getSelectedItem()
				String str = (String) combo.getSelectedItem();
				txt.setText(str);
				
				// 중복 방지
				for(int i=0; i<combo.getItemCount(); i++) {
					if( combo.getItemAt(i).equals(str) )
						return;
				}
				
				combo.addItem(str);
			}
		};
		
		combo.addActionListener(li);
		
		pane.add(combo, BorderLayout.CENTER);
		pane.add(txt, BorderLayout.SOUTH);
		
		newJFrame(pane);
	}
	
	public void newJFrame(JComponent c) {
		JFrame frame = new JFrame("컴포넌트 테스트");
		frame.setBounds(1500, 60, 500, 500);
		frame.setDefaultCloseOperation(DISPOSE_ON_CLOSE);

		ImageIcon img = new ImageIcon("./src/component/mi.jpg");
		JPanel panel = new JPanel(){
			@Override
			protected void paintComponent(Graphics g) {
				Dimension d = getSize();
				g.drawImage(img.getImage(), 0, 0, d.width, d.height, null);
				
				setOpaque(false);
				super.paintComponent(g);
			}
		};
		
//		panel.setLayout(null);
		panel.add(c);
		
//		frame.add(panel);
		frame.getContentPane().add(panel);
		
		frame.setVisible(true);
	}
	
	public static void main(String[] args) {
		new ComponentEx2();
	}
}
