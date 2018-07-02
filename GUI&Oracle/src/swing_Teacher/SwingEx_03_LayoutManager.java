package swing_Teacher;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridLayout;

import javax.swing.JButton;
import javax.swing.JFrame;

public class SwingEx_03_LayoutManager extends JFrame {
	private SwingEx_03_LayoutManager() {
		setTitle("LayoutManager Example"); // 윈도우 제목
		
		setLocation(1400, 50); //위치 설정
		setSize(500, 500); //크기 설정
		
		setDefaultCloseOperation(EXIT_ON_CLOSE); //닫기 설정
		
		//--- 프레임 구성 작업 ---
//		flowLayoutEx();
//		borderLayoutEx();
		gridLayoutEx();
		//---------------
		
		setVisible(true); //보이기 설정
	}

	private void gridLayoutEx() {
//		setLayout( new GridLayout() );
//		setLayout( new GridLayout(3, 0) );
//		setLayout( new GridLayout(0, 3) );
		setLayout( new GridLayout(0, 3, 10, 20) );
		
		JButton[] btn = new JButton[8];
		for(int i=0; i<btn.length; i++)
			btn[i] = new JButton("버튼"+(i+1));
		
		for(int i=0; i<btn.length; i++)
			add(btn[i]);
	}
	
	private void borderLayoutEx() {
//		setLayout( new BorderLayout() );
		setLayout( new BorderLayout(30, 15) );
		
		JButton[] btn = new JButton[5];
		for(int i=0; i<btn.length; i++)
			btn[i] = new JButton("버튼"+(i+1));

//		add(btn[0]);
		
		add(btn[0], "East");
		add(btn[1], "West");
		add("Center", btn[2]);
		add(btn[3], BorderLayout.NORTH);
		add(BorderLayout.SOUTH, btn[4]);
		
	}

	private void flowLayoutEx() {
//		setLayout( new FlowLayout() );
//		setLayout( new FlowLayout(FlowLayout.RIGHT) );
		setLayout( new FlowLayout(
				FlowLayout.CENTER, 20, 40) );
		
		add(new JButton("버튼3"));
		add(new JButton("버튼1"));
		add(new JButton("버튼5"));
		add(new JButton("버튼2"));
		add(new JButton("버튼7"));
		add(new JButton("버튼4"));
		add(new JButton("버튼66666666666666"));
		
		JButton btn = new JButton("버튼8");
		
//		btn.setSize(200,200);
		btn.setPreferredSize(new Dimension(200, 200));
		
		add(btn);
		
	}
	
	public static void main(String[] args) {
		new SwingEx_03_LayoutManager();
	}
}














