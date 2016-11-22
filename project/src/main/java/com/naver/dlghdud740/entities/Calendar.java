package com.naver.dlghdud740.entities;


import org.springframework.stereotype.Component;


//동호회
@Component
public class Calendar {
	private String eventTitle;
	private String host;
	private String eventContent;
	public String getEventTitle() {
		return eventTitle;
	}
	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getEventContent() {
		return eventContent;
	}
	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}
	
}