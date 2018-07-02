package awt;

// + GUI , Graphic User Interface
// <ㅡ> CLI , Command Line Interface
//
// + 자바의 GUI 
//  - JDK API에 포함되어있음
//  - AWT
//  - Swing
//  - JavaFX
//
// + 자바 GUI 프로그램의 구성요소
// 1. 컨테이너, Container
//     윈도우(창, window) 역할을 하는 요소
//     프로그램의 구성 요소들이 올라가는 곳
//     ex) Frame, Window, Panel, Dialog, Applet
// 2. 컴포넌트, Component
//     컨테이너 위에 올려지는 화면 구성 요소
//     ex)Button, TextField, Label, List, CheckBox 등등
// 3. 배치관리자, LayoutManager
//     컨테이너에 컴포넌트가 배치될 크기와 위치를 결정하는 요소
//     ex) BoarderLayout, GridLayout, FlowLayout, CardLayout 등등
// 4. 이벤트, Event
//     사용자의 동작(입력)에 대한 반응을 결정하는 요소
//     (주로 컴포넌트의 반응) 



import java.awt.Button;
import java.awt.Color;
import java.awt.Frame;
import java.awt.GridLayout;
import java.awt.Label;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;

// + AWT, Abstract Window Toolkit
// - 추상 윈도우(창) 개발도구
// - java.awt 패키지에 포함
// - 운영체제가 가지고 있는 GUI(그래픽) 표현법을 사용한다
// - 운영체제에 따라서 모양(테마)가 바뀐다
// - 단순히 운영체제와 프로그램을 어어주는 GUI 라이브러리이다


public class AwtEx {
	
	// 컨테이너 Frame
	private Frame fr;
	
	// 컴포넌트 Button
	private Button btn1;
	private Button btn2;
	
	// 컴포넌트 Label
	private Label lbl;

	
	private AwtEx() {
		
		// ------ 프레임 생성 --------
		fr = new Frame("myFrame"); // 프레임 타이틀 지정
		fr.setVisible(true);  // 프레임 보이기 설정
		//------------------------
		
		//------- 프레임 설정 --------
		fr.setLayout(new GridLayout(3,1)); // 배치관리자 설정
		fr.setLocation(100, 100); // 프레임 위치
		fr.setSize(500, 500);  // 프레임 크기
		//------------------------
		
		//------- 프레임이벤트 설정------
		windowEvent();
		//-------------------------
		
		//-------- 컴포넌트 설정 -------
		showLabel();
		showButton();
		//-------------------------
		
			
			
	}
	
	//윈도우 이벤트 등록
	
	private void showButton() {
		// 버튼 생성
		btn1 = new Button("안녕하세요");
		btn2 = new Button();
		btn2.setLabel("반가워요");
		
		// 버튼 이벤트 추가
		buttonEvent();
		
		// 프레임에 버튼 추가
		fr.add(btn1);
		fr.add(btn2);
		
	}

	private void buttonEvent() {
		
		//버튼1에 이벤트 리스너 등록
		btn1.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
//				System.out.println(e);
				lbl.setText("버튼1이 작동함(눌림)");
			}
		});
		
		//버튼2에 이벤트 리스너 등록
		btn2.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				lbl.setText("버튼2 작동!!");
			}
		});
	}

	
	
	private void showLabel() {
		lbl = new Label(); //레이블 생성
		lbl.setText("레이블입니다"); //레이블텍스트 설정
		
		lbl.setAlignment(Label.CENTER); //레이블 가운데 정렬
		lbl.setBackground(Color.GRAY); //배경색 회색
		
		fr.add(lbl); //프레임에 레이블 추가
	}

	private void windowEvent() {
		
		//------ 프레임 이벤트 등록 ------------------------------------
				WindowListener l; //WindowListener interface
				
				//WindowListener구현 클래스 windowAdapter 객체
				l = new WindowAdapter() { 
					
					@Override
					public void windowClosing(WindowEvent e) {
						System.out.println(e);
						System.exit(0); //정상종료 매개변수 0
					}
					
				};
				
				fr.addWindowListener(l);//프레임 추가 메소드
				
//				fr.addWindowListener(new WindowAdapter() {
//					
//					@Override
//					public void windowClosing(WindowEvent e) {
//					
//						
//					}
//					
//				}); // 익명객체 생성하여 매개변수로 바로 넣기
		
		//---------------------------------------------------------------
		
		
	}
	
	public static void main(String[] args) {
		
		new AwtEx();
		
		
		
		
	}
	
	
}
