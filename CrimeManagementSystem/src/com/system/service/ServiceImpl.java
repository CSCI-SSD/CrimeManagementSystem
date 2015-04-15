package com.system.service;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.sql.DataSource;

import com.system.beans.LoginBean;
import com.system.beans.RegiatrationBean;
import com.system.beans.RequestBean;
import com.system.util.SystemConstants;

public class ServiceImpl implements Service {
	
	private DataSource dataSource;

	@Override
	public LoginBean userLogin(LoginBean loginBean) {
		
		Connection connection = null;
		Statement statement = null;
		
		try {
			connection = dataSource.getConnection();
			statement = connection.createStatement();
			String query = "SELECT LASTNAME, EMAIL, PASSWORD, STATUS, USERTYPE from USERDETAILS where EMAIL ='"+loginBean.getUserName()+"'";
			ResultSet rs = statement.executeQuery(query);
			if (rs.next()) {
				String password = rs.getString("PASSWORD");
				String status = rs.getString("STATUS");
				
				loginBean.setLastName(rs.getString("LASTNAME"));
				loginBean.setType(rs.getString("USERTYPE"));
				
				if(password.equals(loginBean.getPasswrd())) {
					loginBean.setStatus(status);
				} else {
					loginBean.setStatus(null);	
				}
			}
			
		} catch (SQLException sqlException) {
			loginBean.setStatus(null);	
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return loginBean;
		
	}

	@Override
	public String createNewRequest(RequestBean requestBean) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement statement = null;
		
		try {
			connection = dataSource.getConnection();
			statement = connection.prepareStatement("INSERT INTO CRIMEREQUEST (EMAIL, TYPEOFCRIME, CRIMEDATE, DESCRIPTION, SUSPECTDETAILS, NOTES, STATUS) VALUES (?,?,?,?,?,?,?)");
			statement.setString(1, requestBean.getUserEmail());
			statement.setString(2, requestBean.getTypeofcrime());
			statement.setString(3, requestBean.getCrimedate());
			statement.setString(4, requestBean.getDescription());
			statement.setString(5, requestBean.getSuspectDetails());
			statement.setString(6, requestBean.getNotes());
			statement.setString(7, requestBean.getStatus());
			int satus = statement.executeUpdate();
			if (satus==1) {
				return SystemConstants.SUCESS_CREATING_REQUEST;
			} else {
				return SystemConstants.UNSUCESS_CREATING_REQUEST;
			}
		} catch (SQLException sqlException) {
			sqlException.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return SystemConstants.UNSUCESS_CREATING_REQUEST;
	}

	/**
	 * @return the dataSource
	 */
	public DataSource getDataSource() {
		return dataSource;
	}

	/**
	 * @param dataSource the dataSource to set
	 */
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public List<RequestBean> getCrimeDetailsUser(String userEmail) {
		Connection connection = null;
		Statement statement = null;
		List<RequestBean> requestBeans = null;
		try {
			connection = dataSource.getConnection();
			statement = connection.createStatement();
			String query = "select * from  CRIMEREQUEST where  EMAIL='"+userEmail+"'";
			ResultSet rs = statement.executeQuery(query);
			requestBeans = new ArrayList<RequestBean>();
			while (rs.next()) {
				RequestBean requestBean = new RequestBean();
				requestBean.setRequestId(rs.getInt(1));
				requestBean.setTypeofcrime(rs.getString(3));
				requestBean.setCrimedate(rs.getString(4));
				requestBean.setDescription(rs.getString(5));
				requestBean.setSuspectDetails(rs.getString(6));
				requestBean.setStatus(rs.getString(8));
				requestBeans.add(requestBean);
			}
			
		} catch (SQLException sqlException) {
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return requestBeans;
	}

	@Override
	public String updateRequest(RequestBean requestBean) {
		Connection connection = null;
		PreparedStatement statement = null;
		
		try {
			connection = dataSource.getConnection();
			statement = connection.prepareStatement("UPDATE CRIMEREQUEST SET TYPEOFCRIME=?, CRIMEDATE=?, DESCRIPTION=?, SUSPECTDETAILS=?, NOTES=?, STATUS=? where ERSREQUESTID = ? ");
			statement.setString(1, requestBean.getTypeofcrime());
			statement.setString(2, requestBean.getCrimedate());
			statement.setString(3, requestBean.getDescription());
			statement.setString(4, requestBean.getSuspectDetails());
			statement.setString(5, requestBean.getNotes());
			statement.setString(6, requestBean.getStatus());
			statement.setInt(6, requestBean.getRequestId());
			
			int satus = statement.executeUpdate();
			if (satus==1) {
				return SystemConstants.SUCESS_UPDATING_REQUEST;
			} else {
				return SystemConstants.UNSUCESS_UPDATING_REQUEST;
			}
		} catch (SQLException sqlException) {
			sqlException.printStackTrace();
			return SystemConstants.UNSUCESS_UPDATING_REQUEST;
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
	}

	@Override
	public String deleteRequest(RequestBean requestBean) {
		Connection connection = null;
		PreparedStatement statement = null;
		
		try {
			connection = dataSource.getConnection();
			statement = connection.prepareStatement("DELETE FROM CRIMEREQUEST ID = ? ");
			statement.setInt(1, requestBean.getRequestId());
			int satus = statement.executeUpdate();
			if (satus==1) {
				return SystemConstants.SUCESS_DELETING_REQUEST;
			} else {
				return SystemConstants.UNSUCESS_CREATING_REQUEST;
			}
		} catch (SQLException sqlException) {
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return SystemConstants.UNSUCESS_CREATING_REQUEST;
	}

	@Override
	public List<RequestBean> getCrimeDetailsAdmin() {
		Connection connection = null;
		Statement statement = null;
		List<RequestBean> requestBeans = null;
		try {
			connection = dataSource.getConnection();
			statement = connection.createStatement();
			String query = "select * from  CRIMEREQUEST where  EMPLOYEEID ";
			ResultSet rs = statement.executeQuery(query);
			requestBeans = new ArrayList<RequestBean>();
			while (rs.next()) {
				RequestBean requestBean = new RequestBean();
				requestBean.setRequestId(rs.getInt(1));
				requestBean.setTypeofcrime(rs.getString(3));
				requestBean.setCrimedate(rs.getString(4));
				requestBean.setDescription(rs.getString(5));
				requestBean.setSuspectDetails(rs.getString(6));
				requestBean.setStatus(rs.getString(8));
				requestBeans.add(requestBean);
				
				requestBeans.add(requestBean);
			}
			
		} catch (SQLException sqlException) {
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return requestBeans;
	}


	@Override
	public String registerUser(RegiatrationBean regiatrationBean) {
		Connection connection = null;
		PreparedStatement statement = null;
		
		try {
			connection = dataSource.getConnection();
			
			statement = connection.prepareStatement("INSERT INTO USERDETAILS (FIRSTNAME, LASTNAME, EMAIL, PASSWORD, STATUS, ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, PIN, PHONE,USERTYPE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");
			statement.setString(1, regiatrationBean.getFirstName());
			statement.setString(2, regiatrationBean.getLastName());
			statement.setString(3, regiatrationBean.getEmail());
			statement.setString(4, regiatrationBean.getPassword());
			statement.setString(5, "REQUIRED");
			statement.setString(6, regiatrationBean.getAdd1());
			statement.setString(7, regiatrationBean.getAdd2());
			statement.setString(8, regiatrationBean.getCity());
			statement.setString(9, regiatrationBean.getState());
			statement.setString(10, regiatrationBean.getPin());
			statement.setString(11, regiatrationBean.getPhone());
			statement.setString(12, SystemConstants.ROLE_USER);
			int satus = statement.executeUpdate();
			
			Random random = new Random();
			StringBuilder sb = new StringBuilder(6);
		    for(int i=0; i < 6; i++)
		        sb.append((char)('0' + random.nextInt(10)));
		    
		    int randomNumber = Integer.parseInt(sb.toString());
			
			statement = connection.prepareStatement("INSERT INTO USERVALIDATION (EMAIL, CODE, VALIDATION) VALUES (?,?,?)");
			statement.setString(1, regiatrationBean.getEmail());
			statement.setInt(2, randomNumber);
			statement.setString(3, "REQUIRED");
			
			emailGeneration(regiatrationBean.getEmail(), randomNumber, regiatrationBean.getLastName());
			
			int status1 = statement.executeUpdate();
			
			if (satus==1 && status1 == 1) {
				return SystemConstants.REGISTRATION_SUCCESS;
			} else {
				return SystemConstants.REGISTRATION_UNSUCCESS;
			}
			
		} catch (SQLException sqlException) {
			sqlException.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return SystemConstants.REGISTRATION_UNSUCCESS;
	}

	private void emailGeneration(String email, Integer randomNumber, String lastName) {
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
 
		Session session = Session.getDefaultInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("ssd.project.crm@gmail.com","qwerQWER1234");
				}
			});
 
		try {
 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("ssd.project.crm@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(email));
			message.setSubject("Crime Management System Account Validation");
			message.setText("Dear " +lastName+ ","+
					" \n\n Please enter validation code "+randomNumber+" To complete the registration process \n\n Thanks\nCrime ManagementSystem");
 
			Transport.send(message);
 
			System.out.println("Email sent sucessfull");
 
		} catch (MessagingException e) {
			System.out.println("Email sent un sucessfull");
			throw new RuntimeException(e);
		}
	}

	@Override
	public String reSendEmail(RegiatrationBean regiatrationBean) {
		Connection connection = null;
		Statement statement = null;
		
		try {
			connection = dataSource.getConnection();
			statement = connection.createStatement();
			String query = "SELECT * from USERVALIDATION where EMAIL ='"+regiatrationBean.getEmail()+"'";
			ResultSet rs = statement.executeQuery(query);
			if (rs.next()) {
				String status = rs.getString(3);
				int code = rs.getInt(2);
				if (status != null && status.equals("REQUIRED")) {
					emailGeneration(regiatrationBean.getEmail(), code, "User");
					return "sent";
				} else {
					return "NotSent";
				}
			} else {
				return "NotSent";
			}
			
		} catch (SQLException sqlException) {
			sqlException.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return "NotSent";
	}

	@Override
	public String validateUser(RegiatrationBean regiatrationBean) {
		Connection connection = null;
		Statement statement = null;
		
		try {
			connection = dataSource.getConnection();
			statement = connection.createStatement();
			String query = "SELECT * from USERVALIDATION where EMAIL ='"+regiatrationBean.getEmail()+"'";
			ResultSet rs = statement.executeQuery(query);
			if (rs.next()) {
				String status = rs.getString(3);
				int code = rs.getInt(2);
				
				if (status != null && status.equals("REQUIRED") && code == Integer.parseInt(regiatrationBean.getCode()) ) {
					
					PreparedStatement preparedStatement = connection.prepareStatement("UPDATE USERVALIDATION SET VALIDATION='SUCCESS' where EMail = ?");
					preparedStatement.setString(1, regiatrationBean.getEmail());
					
					int state = preparedStatement.executeUpdate();

					preparedStatement = connection.prepareStatement("UPDATE USERDETAILS SET STATUS ='SUCCESS' where EMail = ?");
					preparedStatement.setString(1, regiatrationBean.getEmail());
					
					int state1 = preparedStatement.executeUpdate();
					
					if (state == 1 && state1 == 1)  {
						
						
						Properties props = new Properties();
						props.put("mail.smtp.host", "smtp.gmail.com");
						props.put("mail.smtp.socketFactory.port", "465");
						props.put("mail.smtp.socketFactory.class",
								"javax.net.ssl.SSLSocketFactory");
						props.put("mail.smtp.auth", "true");
						props.put("mail.smtp.port", "465");
				 
						Session session = Session.getDefaultInstance(props,
							new javax.mail.Authenticator() {
								protected PasswordAuthentication getPasswordAuthentication() {
									return new PasswordAuthentication("ssd.project.crm@gmail.com","qwerQWER1234");
								}
							});
				 
						try {
				 
							Message message = new MimeMessage(session);
							message.setFrom(new InternetAddress("ssd.project.crm@gmail.com"));
							message.setRecipients(Message.RecipientType.TO,
									InternetAddress.parse(regiatrationBean.getEmail()));
							message.setSubject("Crime Management System Account Validation");
							message.setText("Dear User, "+
									" \n\n Registration process is Successfull. \n\n Thanks\nCrime ManagementSystem");
				 
							Transport.send(message);
				 
							System.out.println("Email sent sucessfull");
				 
						} catch (MessagingException e) {
							System.out.println("Email sent un sucessfull");
							throw new RuntimeException(e);
						}
						
						
						
						return "ValidatedUser";
					} else {
						return "NotValidatedUser";
					}
					
				} else {
					return "NotValidatedUser";
				}
			} 
			
		} catch (SQLException sqlException) {
			sqlException.printStackTrace();
		} catch (NumberFormatException numberFormatException) {
			numberFormatException.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return "NotValidatedUser";
	}

}
