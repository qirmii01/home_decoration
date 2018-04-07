package com.hd.domain;

import java.io.Serializable;

public class DecorationEffect implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column decoration_effect.id
     *
     * @mbg.generated
     */
    private String id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column decoration_effect.user_id
     *
     * @mbg.generated
     */
    private String userId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column decoration_effect.apply_id
     *
     * @mbg.generated
     */
    private String applyId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column decoration_effect.title
     *
     * @mbg.generated
     */
    private String title;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table decoration_effect
     *
     * @mbg.generated
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table decoration_effect
     *
     * @mbg.generated
     */
    public DecorationEffect(String id, String userId, String applyId, String title) {
        this.id = id;
        this.userId = userId;
        this.applyId = applyId;
        this.title = title;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table decoration_effect
     *
     * @mbg.generated
     */
    public DecorationEffect() {
        super();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column decoration_effect.id
     *
     * @return the value of decoration_effect.id
     *
     * @mbg.generated
     */
    public String getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column decoration_effect.id
     *
     * @param id the value for decoration_effect.id
     *
     * @mbg.generated
     */
    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column decoration_effect.user_id
     *
     * @return the value of decoration_effect.user_id
     *
     * @mbg.generated
     */
    public String getUserId() {
        return userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column decoration_effect.user_id
     *
     * @param userId the value for decoration_effect.user_id
     *
     * @mbg.generated
     */
    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column decoration_effect.apply_id
     *
     * @return the value of decoration_effect.apply_id
     *
     * @mbg.generated
     */
    public String getApplyId() {
        return applyId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column decoration_effect.apply_id
     *
     * @param applyId the value for decoration_effect.apply_id
     *
     * @mbg.generated
     */
    public void setApplyId(String applyId) {
        this.applyId = applyId == null ? null : applyId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column decoration_effect.title
     *
     * @return the value of decoration_effect.title
     *
     * @mbg.generated
     */
    public String getTitle() {
        return title;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column decoration_effect.title
     *
     * @param title the value for decoration_effect.title
     *
     * @mbg.generated
     */
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table decoration_effect
     *
     * @mbg.generated
     */
    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        DecorationEffect other = (DecorationEffect) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getUserId() == null ? other.getUserId() == null : this.getUserId().equals(other.getUserId()))
            && (this.getApplyId() == null ? other.getApplyId() == null : this.getApplyId().equals(other.getApplyId()))
            && (this.getTitle() == null ? other.getTitle() == null : this.getTitle().equals(other.getTitle()));
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table decoration_effect
     *
     * @mbg.generated
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getUserId() == null) ? 0 : getUserId().hashCode());
        result = prime * result + ((getApplyId() == null) ? 0 : getApplyId().hashCode());
        result = prime * result + ((getTitle() == null) ? 0 : getTitle().hashCode());
        return result;
    }
}