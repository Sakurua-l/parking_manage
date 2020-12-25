package com.drx.controller;

import com.drx.MyUtil.MyDateUtil;
import com.drx.po.Car;
import com.drx.po.ParkingTime;
import com.drx.service.CarService;
import com.drx.service.FareService;
import com.drx.service.ParkingTimeService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;


@Controller
@RequestMapping("/carController")
public class CarController {

    private static Logger logger = Logger.getLogger(CarController.class);

    @Autowired
    private CarService carService;
    @Autowired
    private ParkingTimeService parkingTimeService;

    @Autowired
    private FareService fareService;

    @RequestMapping("/findCarsByDriverId.driverId")
    public @ResponseBody List<Car> findCarsByDriverId(int driverId) throws Exception{
        return carService.findCarsByDriverId(driverId);
    }

    @ResponseBody
    @RequestMapping("/modifyCarMsg.car")
    public void modifyCarMsg(Car car) throws Exception{
        carService.modifyCarMsg(car);
    }

    @ResponseBody
    @RequestMapping("/deleteCar.carId")
    public void deleteCar(int carId) throws Exception{

        List<ParkingTime> times = parkingTimeService.findByCarId(carId);
        ParkingTime parkingTime = times.get(0);
        Date endTime = new Date();
        Date beginTime = parkingTime.getBeginTime();
        parkingTime.setCarId(carId);
        parkingTime.setEndTime(endTime);
        parkingTime.setTotalTime(MyDateUtil.getParkingTimeHour(beginTime,endTime));
        parkingTimeService.updateParkingTimeByCarId(parkingTime);
        int driverId = parkingTimeService.findDriverIdByCarId(carId);
        fareService.addFare(driverId,carId);

        carService.deleteCar(carId);//删除car前 修改parkingTime 以及 添加fare
    }

    @ResponseBody
    @RequestMapping("/addCar.car")
    public Car addCar(Car car) throws Exception{
        logger.info("添加的车辆信息："+car);
        Car c = carService.addCar(car);
        Date bengin = new Date();
        ParkingTime parkingTime = new ParkingTime();
        parkingTime.setBeginTime(bengin);
        parkingTime.setCarId(c.getCarId());
        parkingTime.setDriverId(car.getDriverId());
        parkingTime.setLicenseNum(c.getLicenseNum());
        parkingTimeService.addTime(parkingTime);

        return c;
    }

    @ResponseBody
    @RequestMapping("/modifyCar.car")
    public Car modifyCar(Car car) throws Exception{
        logger.info("修改的车辆信息："+car);
        carService.modifyCar(car);
        ParkingTime time = new ParkingTime();
        time.setCarId(car.getCarId());
        time.setLicenseNum(car.getLicenseNum());
        parkingTimeService.modifyLicenseNum(time);
        System.out.println(time.toString());
        return car;
    }
}
