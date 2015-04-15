/**
 * 
 */
package com.system.beans;

/**
 * @author kartheek
 *
 */
public class RequestBean {
	
	private String userEmail;
	
	private String typeofcrime;
	
	private String crimedate;
	
	private String description;
	
	private String suspectDetails;
	
	private String notes;
	
	private Integer requestId;
	
	private String status;

	/**
	 * @return the userEmail
	 */
	public String getUserEmail() {
		return userEmail;
	}

	/**
	 * @param userEmail the userEmail to set
	 */
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	/**
	 * @return the typeofcrime
	 */
	public String getTypeofcrime() {
		return typeofcrime;
	}

	/**
	 * @param typeofcrime the typeofcrime to set
	 */
	public void setTypeofcrime(String typeofcrime) {
		this.typeofcrime = typeofcrime;
	}

	/**
	 * @return the crimedate
	 */
	public String getCrimedate() {
		return crimedate;
	}

	/**
	 * @param crimedate the crimedate to set
	 */
	public void setCrimedate(String crimedate) {
		this.crimedate = crimedate;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the suspectDetails
	 */
	public String getSuspectDetails() {
		return suspectDetails;
	}

	/**
	 * @param suspectDetails the suspectDetails to set
	 */
	public void setSuspectDetails(String suspectDetails) {
		this.suspectDetails = suspectDetails;
	}

	/**
	 * @return the notes
	 */
	public String getNotes() {
		return notes;
	}

	/**
	 * @param notes the notes to set
	 */
	public void setNotes(String notes) {
		this.notes = notes;
	}

	/**
	 * @return the requestId
	 */
	public Integer getRequestId() {
		return requestId;
	}

	/**
	 * @param requestId the requestId to set
	 */
	public void setRequestId(Integer requestId) {
		this.requestId = requestId;
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	
}
