package swing;

import javax.swing.JFrame;


// + 스윙, Swing
//  - AWT를 이용하여 작성된 자바의 GUI 라이브러리
//  - AWT의 모든 기능을 가지고 있다
//  - 대부분의 스윙 클래스는 앞에 J가 붙어있다
//      ex)  AWT         ->      Swing
//           Component ->   JComponent
//           Frame        ->     JFrame
//           Button       ->     JButon
//           Label         ->     JLabel
//  - javax.swing 패키지에 포함
//  - 스윙의 최상위 클래스 : JComponent
          



public class SwingEx_01_Basic {

	public static void main(String[] args) {
		
		//프레임 설정
		JFrame frame = new JFrame("스윙GUI");
		
//		 + 기본 컨테이너(메인 프레임)을 생성하는 방법
//		  1. JFrame 객체를 생성해서 프레임 띄우기
//		     JFrame jfr = new JFrame();
//		     jfr.setVisible(true);
//
//		  2. JFrame 클래스를 상속받아서 프레임 띄우기
//		     public class MyFrame extends JFrame{        
//		       public MyFrame() {
//		          setvisible(true);
//		       }
//		    }

		
		//프레임 위치와 크기 설정
		frame.setLocation(100, 100);
		frame.setSize(500, 500);
		
		//프레임 보이기 설정
		frame.setVisible(true);
		
		//프레임 closing 이벤트 설정
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		
		//EXIT_ON_CLOSE : 프로그램 종료
		//DISPOSE_ON_CLOSE : 윈도우 종료(마지막 윈도우면 프로그램 종료)
		//HIDE_ON_CLOSE : 종료하지 않고 닫기
		//DO_NOTHING_ON_CLOSE : 아무것도 안하기
		
		
		
	}
}
