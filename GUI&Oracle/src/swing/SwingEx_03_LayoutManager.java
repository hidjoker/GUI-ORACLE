package swing;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridLayout;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.border.Border;

public class SwingEx_03_LayoutManager extends JFrame{

//	 + 배치관리자, LayoutManager
//	   - 컨테이너의 레이아웃을 지정하는 요소
//	   - 레이아웃 : 컴포넌트들을 어떻게 배치할 것인지에 대한 전략
//	   - 배치관리자는 생성자에서 많은 설정을 하기때문에
//	     생성자를 잘 보아야한다

	
	private SwingEx_03_LayoutManager() {
		setTitle("LayoutManager Example"); //윈도우 제목
		
		setLocation(100, 100); //위치 설정
		setSize(500, 500); //크기 설정
		
		setDefaultCloseOperation(EXIT_ON_CLOSE); //닫기 설정
		
		
		//---- 프레임 구성 작업 ----
//		flowLayoutEx();
//		borderLayoutEx();
		gridLayoutEx();
		
		//--------------------
		
		setVisible(true); //보이기 설정(메모리에 저장된 것을 모니터에 표시)
		
		
		
	}
	
//	 + GridLayout
//	    - 행과 열을 가지는 표(테이블) 형식의 배치
//	    - 생성자에서 행 또는 열의 개수를 고정해서 사용한다
//	        new GridLayout(x, 0) ㅡ> 행수를 x로 고정
//	        new GridLayout(0, x) ㅡ> 열수를 x로 고정
//	       행과 열을 둘다 설정하지 않고 하나만 설정하는 것이 좋다
//	       (고정시키려는 값을 집어넣고 다른 것은 숫자0으로 채운다)
//	    - 컨테이너의 크기 변경에 컴포넌트가 영향을 받음
//	    - 컴포넌트는 모두 같은 크기를 가진다
//	    - hgap, vgap 설정 가능


	private void gridLayoutEx() {
//		setLayout(new GridLayout());
//		setLayout(new GridLayout(3, 0));
//		setLayout(new GridLayout(0, 3));
		setLayout(new GridLayout(0, 3, 10, 20));

		
		JButton[] btn = new JButton[8];
		for(int i=0 ; i<btn.length ; i++)
			btn[i] = new JButton("버튼"+(i+1));	
		
		for(int i=0 ; i<btn.length ; i++)
			add(btn[i]);
		
	}
	
//	+ BorderLayout
//	   - 컨테이너의 영역을 동, 서, 남, 북, 중앙 으로 나누어 배치
//	   - hgap, vgap 지정 가능
//	   - 컨테이너의 크기가 변경되면 컴포넌트의 크기도 변경된다
//	       North, South는 컨테이너의 너비 영향받음
//	       East, West는 컨테이너의 높이 영향받음
//	       Center 너비, 높이 모두 영향받음
	

	private void borderLayoutEx() {
//		setLayout( new BorderLayout()); //기본(default) 레이아웃 매니저
		setLayout( new BorderLayout(30,15));
		
		
		JButton[] btn = new JButton[5];
		for(int i=0 ; i<btn.length ; i++)
			btn[i] = new JButton("버튼"+(i+1));
		
//		add(btn[0]);
		
		add(btn[0], "East");
		add(btn[1], "West");
		add("Center", btn[2]);
		add(btn[3], BorderLayout.NORTH);
		add(BorderLayout.SOUTH, btn[4]);
		
	}

//	 + FlowLayout
//	   - 컴포넌트가 추가되는 순서에 맞춰 왼쪽 ㅡ> 오른쪽으로 이어서 배치
//	   - 컨테이너의 한 줄에 배치할 공간이 부족하면 다음 줄에 배치
//	   - 컨테이너의 크기가 컴포넌트의 크기에 영향을 주지 않는다
//	   - 정렬되는 위치 설정 가능
//	   - hgap, vgap 설정 가능

	
	
	private void flowLayoutEx() {
//		setLayout(new FlowLayout()); 
//		setLayout(new FlowLayout(FlowLayout.RIGHT));	
		setLayout(new FlowLayout(FlowLayout.CENTER,20 ,40));
		
		add(new JButton("버튼1"));
		add(new JButton("버튼3"));
		add(new JButton("버튼2"));
		add(new JButton("버튼4"));
		add(new JButton("버튼5"));
		add(new JButton("버튼7"));
		add(new JButton("버튼66666666666666666666666666666666666666666"));
		
		JButton btn = new JButton("버튼8");

		//		btn.setSize(200,200); 
		//레이아웃 매니저에 우선권에 의해 버튼 사이즈가 강제됨
		
		//우선권을 부여하고 사이즈를 바꿔주면 바뀜
		btn.setPreferredSize(new Dimension(200, 200));
		add(btn);
	}

	public static void main(String[] args) {
		new SwingEx_03_LayoutManager();
	}
	
}

