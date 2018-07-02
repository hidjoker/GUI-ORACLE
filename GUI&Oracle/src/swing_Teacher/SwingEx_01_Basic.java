package swing_Teacher;

import javax.swing.JFrame;

public class SwingEx_01_Basic {
	public static void main(String[] args) {
	
		// 프레임 생성
		JFrame frame = new JFrame("스윙 GUI");

		// 프레임 위치와 크기 설정
		frame.setLocation(1400, 50);
		frame.setSize(500, 500);
	
		// 프레임 보이기 설정
		frame.setVisible(true);

		// 프레임 closing 이벤트 설정
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		// EXIT_ON_CLOSE : 프로그램 종료
		// DISPOSE_ON_CLOSE : 윈도우 종료(마지막윈도우면 프로그램종료)
		// HIDE_ON_CLOSE : 종료하지 않고 닫기
		// DO_NOTHING_ON_CLOSE : 아무것도 안하기
	}
}














