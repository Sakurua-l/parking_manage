package com.drx.service;

import com.drx.dto.FareMsg;
import com.drx.po.Fare;

import java.util.List;

public interface FareService {
    void addFares(int driverId) throws Exception;
    List<FareMsg> showFares(int driverId) throws Exception;
    void addFare(int driverId,int carId) throws Exception;
    void pay(int fareId)throws Exception;
}
