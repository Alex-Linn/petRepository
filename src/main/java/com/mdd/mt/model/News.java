package com.mdd.mt.model;

import java.util.Date;

public class News {
    private Integer id;

    private String newTitle;

    private String newPicture;

    private String newWebsite;

    private Date createTime;

    @Override
	public String toString() {
		return "News [id=" + id + ", newTitle=" + newTitle + ", newPicture=" + newPicture + ", newWebsite=" + newWebsite
				+ ", createTime=" + createTime + ", newContext=" + newContext + "]";
	}

	private String newContext;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNewTitle() {
        return newTitle;
    }

    public void setNewTitle(String newTitle) {
        this.newTitle = newTitle == null ? null : newTitle.trim();
    }

    public String getNewPicture() {
        return newPicture;
    }

    public void setNewPicture(String newPicture) {
        this.newPicture = newPicture == null ? null : newPicture.trim();
    }

    public String getNewWebsite() {
        return newWebsite;
    }

    public void setNewWebsite(String newWebsite) {
        this.newWebsite = newWebsite == null ? null : newWebsite.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getNewContext() {
        return newContext;
    }

    public void setNewContext(String newContext) {
        this.newContext = newContext == null ? null : newContext.trim();
    }
}