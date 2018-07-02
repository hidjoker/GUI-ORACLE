package swing;

import javax.swing.JFrame;

public class SwingEx_08_Dispose extends JFrame{
	
	public SwingEx_08_Dispose() {
		// 메인 윈도우
		setBounds(100,100,600,400);
		setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		setVisible(true);
		
		// 추가 윈도우
		JFrame another = new JFrame();
		another.setBounds(400,200,600,400);
		another.setDefaultCloseOperation(EXIT_ON_CLOSE);
		another.setVisible(true);
	}

	
	public static void main(String[] args) {
		new SwingEx_08_Dispose();
		
		
		
		
	}
}

