package com.drx.po;

import lombok.Data;
import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;

import java.io.Serializable;

@Component
@Data
@Alias("user")
public class User implements Serializable {
    private int userId;
    private String username;
    private String password;
    private int authority;
    private int driverId;
    private String gender;
    private String phone;
    private String address;
    private String idCardNum;


}
