package work;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JList;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.ListSelectionModel;
import javax.swing.border.BevelBorder;
import javax.swing.border.EtchedBorder;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;

public class HelpDialog extends JDialog implements ListSelectionListener, ActionListener{

	/**
	 * 도움말 다이얼로그
	 * 최근 작성일 : 7. 17
	 * 작성자 : 이현우
	 * 필요한 작업 : 캘린더 도움말
	 */
	private static final long serialVersionUID = 1L;
	
	//컴포넌트 멤버
	JList<String> list;
	JTextArea txtHelp;
	JScrollPane scrollPane;
	JButton btnClose;
	
	
	public HelpDialog(JFrame frame,String title,boolean modal,int x,int y) {
		
		//다이얼로그 설정
		super(frame,title,modal);
		setLocation(x, y);
		setSize(500,400);
		setLayout(null);
		
		//JList 설정
		String[] data = {"File메뉴","Record메뉴","View메뉴","Calender","Help메뉴"};
		list = new JList<>(data);
		list.setBounds(10, 20, 80, 105);
		list.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		list.setBackground(new Color(238, 238, 238));
		list.setBorder(new BevelBorder(BevelBorder.LOWERED));
		
		//TextArea 설정
		txtHelp = new JTextArea();
		txtHelp.setFont(new Font("고딕",Font.BOLD,14));
		txtHelp.setEditable(false);
		txtHelp.setLineWrap(true);
		txtHelp.setBackground(new Color(245, 245, 245));	
		
		//scrollPane 설정
		scrollPane = new JScrollPane(txtHelp, JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
				JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
    	scrollPane.setBounds(100, 20, 360, 250);
    	scrollPane.setBorder(new EtchedBorder());
    	
    	//btnClose 설정
    	btnClose = new JButton("닫기");
		btnClose.setBounds(380, 290, 80, 30);
		
		add(scrollPane);
		add(list);
		add(btnClose);
		
		btnClose.addActionListener(this);
		list.addListSelectionListener(this);

	}

	
	//클릭이벤트 처리
	@Override
	public void valueChanged(ListSelectionEvent e) {
		String txt;
		//파일메뉴 도움말
		if(list.getSelectedIndex()==0) {
			txt = "<로그인/로그아웃>\r\n" + 
					"사번을 통해 로그인 하여 프로그램 사용 권한을 가질 수 있습니다. "
					+ "패스워드 분실 시 패스워드 재설정할 수 있습니다.\r\n"
					+ "\r\n" + 
					"<가져오기>\r\n" + 
					"외부의 파일을 이용하여 사원 정보를 불러올 수 있습니다."
					+"파일 형식은 데이터 자료는 dat을 지원하고 사진은  jpg를 지원합니다. \r\n"
					+ "\r\n" + 
					"<내보내기>\r\n" + 
					"사원 인사정보를 파일로 생성하여 저장할 수 있습니다. 파일 형식은 dat, csv 확장자를 지원합니다.\r\n"
					+ "\r\n" + 
					"<환경설정>\r\n" + 
					"서버와 DB, 디렉토리등을 설정할 수 있습니다.\r\n"
					+ "\r\n"
					+ "<종료>\r\n"
					+ "프로그램을 종료합니다";
			txtHelp.setText(txt);
			txtHelp.setCaretPosition(0);
		}
		//레코드메뉴 도움말
		if(list.getSelectedIndex()==1) {
			txt="<신규등록>\r\n" + 
				"신규 사원정보를 등록합니다.\r\n" + 
				"사진 업로드 기능을 제공하며 \r\n" + 
				"정상 등록시 사번은 자동 등록됩니다.\r\n" + 
				"\r\n" + 
				"<조직관리>\r\n" + 
				"부서를 생성,수정,삭제할 수 있습니다.\r\n" + 
				"생성된 부서를 통해 사원을 팀 단위로 관리\r\n" + 
				"할 수 있습니다.\r\n";
			txtHelp.setText(txt);
			txtHelp.setCaretPosition(0);
		}
		//보기 메뉴 도움말
		if(list.getSelectedIndex()==2) {
			txt="<내 정보 보기>\r\n" + 
				"로그인된 사원의 개인 정보를 확인합니다\r\n"
				+"\r\n" + 
				"<3명 보기>\r\n" + 
				"전체 사원의 정보를 3명 단위로 확인할 수 있습니다"
				+"상세보기 기능을 통해 원하는 사원의 정보를 상세히 확인할 수 있습니다.\r\n"
				+"\r\n" + 
				"<사진 보기>\r\n" + 
				"전체 사원의 등록된 사진정보를 확인할 수 있습니다\r\n"
				+"\r\n" + 
				"<전체리스트 보기>\r\n" + 
				"전체사원의 정보를 한 테이블에 모두 확인 할 수 있습니다."
				+" 원하는 사원의 정보를 더블클릭하면 상세보기를 할 수 있습니다\r\n"
				+"\r\n" + 
				"<팀별 보기>\r\n" + 
				"팀별 사원의 정보를 3명 단위로 확인할 수 있습니다"
				+"상세보기 기능을 통해 원하는 사원의 정보를 상세히 확인할 수 있습니다.\r\n";
			txtHelp.setText(txt);
			txtHelp.setCaretPosition(0);
			
		}
		//캘린더 메뉴 도움말
		if(list.getSelectedIndex()==3) {
			txt="<개인 일정 보기>\r\n";
			txtHelp.setText(txt);
			txtHelp.setCaretPosition(0);
			
		}
		//헬프 메뉴 도움말
		if(list.getSelectedIndex()==4) {
			txt="<퀴즈>\r\n" + 
				"사원 맞추기 퀴즈를 제공합니다\r\n"
				+ "\r\n" + 
				"<도움말>\r\n" + 
				"프로그램 사용과 기능에 대한 도움말을 제공합니다\r\n"
				+ "\r\n" + 
				"<크레딧>\r\n" + 
				"크레딧을 확인합니다\r\n"
				+ "\r\n" + 
				"<인정? 어인정에 대하여>\r\n" + 
				"프로그램 버전 정보등을 확인합니다";
			txtHelp.setText(txt);
			txtHelp.setCaretPosition(0);
		}
		
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if(e.getSource()==btnClose)
			dispose();
		
	}
}
