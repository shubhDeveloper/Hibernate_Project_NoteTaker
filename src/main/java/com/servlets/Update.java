package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.note.entity.NoteEntity;
import com.note.helper.FactoryProvider;

public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Update() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			int note_id = Integer.parseInt(request.getParameter("note_id").trim());
			System.out.println("note id = " + note_id);
			Session session = FactoryProvider.getFactory().openSession();
			Transaction txTransaction = session.beginTransaction();
			NoteEntity noteEntity = session.get(NoteEntity.class, note_id);
		    session.update(noteEntity);

			txTransaction.commit();
			session.close();

			response.sendRedirect("index.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
