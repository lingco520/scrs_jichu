package com.daqsoft.entity.gasStation;

import java.util.Date;

/**
 * 加油站实体
 */
public class GasStation {
    /**
     *记录ID
     */
    private Long id;
    /**
     *加油站名称
     */
    private String name;
    /**
     *经度
     */
    private String longitude;
    /**
     *纬度
     */
    private String latitude;
    /**
     *加油站图片
     */
    private String img;
    /**
     *加油站地址
     */
    private String address;
    /**
     *状态
     */
    private Integer status;
    /**
     *景区唯一标示
     */
    private String vcode;
    /**
     *更新时间
     */
    private Date updateTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude == null ? null : longitude.trim();
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude == null ? null : latitude.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getVcode() {
        return vcode;
    }

    public void setVcode(String vcode) {
        this.vcode = vcode == null ? null : vcode.trim();
    }


    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}