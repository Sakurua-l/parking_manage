package com.drx.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;

@Component
@Data
@Alias("registrationMsg")
public class UserMsg {
    private String username;
    private String password;
    private int driverId;
    private String gender;
    private String phone;
    private String address;
    private String repeat;
    private String idCardNum;


}
