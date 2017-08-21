package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

public class Login implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Login ����.");
		String id = request.getParameter("member_id");
		String pwd = request.getParameter("password");

		MemberDao dao = MemberDao.getInstance();
		int result = dao.login(id, pwd);
		System.out.println(id + ", " + pwd);
		if(result>0){
			System.out.println("Login ����  by " + id);
			request.setAttribute("id", id); 
		} else if(result==0){
			System.out.println("��й�ȣ�� ���� �ʽ��ϴ�");
		}else{
			System.out.println("�ش� ID�� ����");
		}
		request.setAttribute("result", result);
		return "login.jsp";
	}

}
