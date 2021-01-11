package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.persistence.Id;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.note.entity.NoteEntity;
import com.note.helper.FactoryProvider;

public class SaveNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveNotesServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String title = request.getParameter("title");
			String content = request.getParameter("content");
			NoteEntity entity = new NoteEntity(title,content ,new Date());
			
//			System.out.println("id is = "+entity.getId()+" title is = "+title+" content is = "+content);
			
			//Hibernate Save :
			SessionFactory factory = FactoryProvider.getFactory();
			Session session = factory.openSession();
			Transaction tx = session.beginTransaction();
			
			session.save(entity);
			
			tx.commit();
			session.close();
			
			response.sendRedirect("index.jsp");
//			System.out.println(title);

		} catch (Exception e) {
			
			e.printStackTrace();
			
		}

	}

}
