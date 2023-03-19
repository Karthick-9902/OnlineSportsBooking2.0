package com.bmg.dao;


import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.PersistenceException;

import org.hibernate.HibernateException;
import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bmg.beans.Admin;
import com.bmg.beans.Booking;
import com.bmg.beans.User;
import com.bmg.beans.Facility;
import com.bmg.beans.Hosting;
import com.bmg.beans.Inbox;
import com.bmg.util.HibernateUtil;

@SuppressWarnings({ "rawtypes", "unchecked" })
public class BMGDaoImpl implements IBMGDao {
	Transaction transaction = null;

	public String registerUser(User user) {

		try (Session session = HibernateUtil.getSession()) {
			transaction = session.beginTransaction();
			session.save(user);
			transaction.commit();
			return "success";
		} catch (HibernateException he) {
			transaction.rollback();
			return "error";
		} catch (Exception e) {
			transaction.rollback();
			return "error";
		}
	}

	@Override
	public String registerAdmin(Admin admin) {
		try (Session session = HibernateUtil.getSession()) {
			transaction = session.beginTransaction();
			session.save(admin);
			transaction.commit();
			return "success";
		} catch (HibernateException he) {
			transaction.rollback();
			return "error";
		} catch (Exception e) {
			transaction.rollback();
			return "error";
		}
	}

	@Override
	public ArrayList<Facility> checkfeed() {
		ArrayList<Facility> facilities = null;
		try (Session session = HibernateUtil.getSession()) {
			Query<Facility> query = session.createQuery("from com.bmg.beans.Facility");
			facilities = (ArrayList<Facility>) query.getResultList();
			return facilities;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean verifyLogin(String mail, String password, String userType) {
		if (userType.equalsIgnoreCase("player")) {
			try (Session session = HibernateUtil.getSession()) {
				Query query = session.createQuery(
						"select email,password from com.bmg.beans.User where email=:mail and password =:password");
				query.setParameter("mail", mail);
				query.setParameter("password", password);
				List<Object[]> user = query.getResultList();
				if (!user.isEmpty()) {
					return true;
				}
			} catch (Exception e) {
			}
		} else if (userType.equalsIgnoreCase("manager")) {
			try (Session session = HibernateUtil.getSession()) {
				Query query = session.createQuery(
						"select email,password from com.bmg.beans.Admin where email=:mail and password =:password");
				query.setParameter("mail", mail);
				query.setParameter("password", password);
				List<Object[]> user = query.getResultList();
				if (!user.isEmpty()) {
					return true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	@Override
	public ArrayList<Facility> getAllFacilities(String ownerMail) {
		ArrayList<Facility> facilities = null;
		try (Session session = HibernateUtil.getSession()) {
			Query<Facility> query = session.createQuery("from com.bmg.beans.Facility where fomail=:mail");
			query.setParameter("mail", ownerMail);
			facilities = (ArrayList<Facility>) query.getResultList();
			return facilities;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public String deleteFacility(String facilityName) {
		try (Session session = HibernateUtil.getSession()) {
			transaction = session.beginTransaction();
			Query<Facility> query = session.createQuery("delete com.bmg.beans.Facility where fname=:name");
			query.setParameter("name", facilityName);
			int update = query.executeUpdate();
			if (update == 1) {
				transaction.commit();
				return "success";
			}
		} catch (HibernateException he) {
			transaction.rollback();
			return "error";
		} catch (Exception e) {
			transaction.rollback();
			return "error";
		}
		return "failed";
	}

	@Override
	public String registerFacility(Facility facility) {
		try (Session session = HibernateUtil.getSession()) {
			transaction = session.beginTransaction();
			session.save(facility);
			try {
				transaction.commit();
				return "success";
			} catch (PersistenceException pe) {
				return "facerror";
			}
		} catch (HibernateException he) {
			transaction.rollback();
			return "error";
		} catch (Exception e) {
			transaction.rollback();
			return "error";
		}
	}

	@Override
	public Facility getFacility(String facilityName) {
		try (Session session = HibernateUtil.getSession()) {
			return session.load(Facility.class, facilityName);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public String updateFaciltiy(Facility facility) {
		try (Session session = HibernateUtil.getSession()) {
			transaction = session.beginTransaction();
			session.update(facility);
			transaction.commit();
			return "success";
		} catch (HibernateException he) {
			transaction.rollback();
			return "error";
		} catch (Exception e) {
			transaction.rollback();
			return "error";
		}
	}

	@Override
	public String bookFacility(Booking booking) {
		try (Session session = HibernateUtil.getSession()) {
			transaction = session.beginTransaction();
			session.save(booking);
			try {
				transaction.commit();
				return "success";
			} catch (PersistenceException pe) {
				return "integrityerror";
			}
		} catch (HibernateException he) {
			transaction.rollback();
			return "error";
		} catch (Exception e) {
			transaction.rollback();
			return "error";
		}
	}

	@Override
	public ArrayList<Booking> getMyBookings(String userMail) {
		try (Session session = HibernateUtil.getSession()) {
			Query<Booking> query = session.createQuery("from com.bmg.beans.Booking where userMail=:mail");
			query.setParameter("mail", userMail);
			return (ArrayList<Booking>) query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public String cancelFacility(String facilityName, LocalDate bookDate) {
		try (Session session = HibernateUtil.getSession()) {
			transaction = session.beginTransaction();
			Query<Facility> query = session
					.createQuery("delete com.bmg.beans.Booking where bookKey.fname=:name and bookKey.bookDate=:date");
			query.setParameter("name", facilityName);
			query.setParameter("date", bookDate);
			int update = query.executeUpdate();
			if (update == 1) {
				transaction.commit();
				return "success";
			}
		} catch (HibernateException he) {
			transaction.rollback();
			return "error";
		} catch (Exception e) {
			transaction.rollback();
			return "error";
		}
		return "failed";
	}

	@Override
	public ArrayList<Booking> getBookings(String ownerMail) {
		try (Session session = HibernateUtil.getSession()) {
			Query<Booking> query = session.createQuery(
					"from com.bmg.beans.Booking where bookKey.fname in (select fname from com.bmg.beans.Facility where fomail=:mail) ");
			query.setParameter("mail", ownerMail);
			return (ArrayList<Booking>) query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public String adminCancelFacility(String facilityName, LocalDate bookDate) {
		try (Session session = HibernateUtil.getSession()) {
			transaction = session.beginTransaction();
			Query<Facility> query = session
					.createQuery("delete com.bmg.beans.Booking where bookKey.fname=:name and bookKey.bookDate=:date");
			query.setParameter("name", facilityName);
			query.setParameter("date", bookDate);
			int update = query.executeUpdate();
			if (update == 1) {
				transaction.commit();
				return "success";
			}
		} catch (HibernateException he) {
			transaction.rollback();
			return "error";
		} catch (Exception e) {
			transaction.rollback();
			return "error";
		}
		return "failed";
	}

	@Override
	public String updateInbox(Inbox inbox) {
		try (Session session = HibernateUtil.getSession()) {
			transaction = session.beginTransaction();
			session.save(inbox);
			transaction.commit();
			return "success";
		} catch (HibernateException he) {
			transaction.rollback();
			return "error";
		} catch (Exception e) {
			transaction.rollback();
			return "error";
		}
	}

	@Override
	public ArrayList<Inbox> getMessages(String usermail) {
		try (Session session = HibernateUtil.getSession()) {
			Query<Inbox> query = session.createQuery("from com.bmg.beans.Inbox where userMail=:mail ");
			query.setParameter("mail", usermail);
			return (ArrayList<Inbox>) query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public ArrayList<Booking> getHostings(String userMail) {
		try (Session session = HibernateUtil.getSession()) {
			Query<Booking> query = session
					.createQuery("from com.bmg.beans.Booking where userMail=:mail and bookType=:type ");
			query.setParameter("mail", userMail);
			query.setParameter("type", "host");
			return (ArrayList<Booking>) query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public ArrayList<Booking> getAllHostings(String userMail) {
		try (Session session = HibernateUtil.getSession()) {
			Query<Booking> query = session
					.createQuery("from com.bmg.beans.Booking where userMail!=:mail and bookType=:type ");
			query.setParameter("mail", userMail);
			query.setParameter("type", "host");
			return (ArrayList<Booking>) query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public String sendJoinRequest(Hosting hosting) {
		try (Session session = HibernateUtil.getSession()) {
			transaction = session.beginTransaction();
			session.save(hosting);
			try {
				transaction.commit();
				return "success";
			} catch (PersistenceException pe) {
				return "already";
			}
		} catch (HibernateException he) {
			transaction.rollback();
			return "error";
		} catch (Exception e) {
			transaction.rollback();
			return "error";
		}
	}

	@Override
	public ArrayList<Hosting> getHostingRequests(String hostMail) {
		try (Session session = HibernateUtil.getSession()) {
			Query<Hosting> query = session
					.createQuery("from com.bmg.beans.Hosting where hostMail=:mail and status=:stat ");
			query.setParameter("mail", hostMail);
			query.setParameter("stat", "pending");
			return (ArrayList<Hosting>) query.getResultList();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public String acceptJoinRequest(Hosting hosting) {
		try (Session session = HibernateUtil.getSession()) {
			transaction = session.beginTransaction();
			session.update(hosting);
			transaction.commit();
			if (hosting.getStatus().equalsIgnoreCase("accept")) {
				return "accepted";
			} else if (hosting.getStatus().equalsIgnoreCase("decline")) {
				return "declined";
			}
		} catch (HibernateException he) {
			transaction.rollback();
			return "error";
		} catch (Exception e) {
			transaction.rollback();
			return "error";
		}
		return "failed";
	}

	@Override
	public Admin getAdminInfo(String mail) {
		try(Session session= HibernateUtil.getSession()){
			return  session.get(Admin.class, mail);
		}catch (HibernateException he) {
			return null;
		}catch (Exception e) {
			return null;
		}
	}

	@Override
	public User getUserInfo(String mail) {
		try(Session session= HibernateUtil.getSession()){
			return  session.get(User.class, mail);
		}catch (HibernateException he) {
			return null;
		}catch (Exception e) {
			return null;
		}
	}

}
