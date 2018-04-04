//
//  ViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class WeatherViewController: UIViewController, CLLocationManagerDelegate , ChangeCityDelegate{
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "fe6704ee59d81942d35477a5c70b820a"
    let weatherDataModel = WeatherDataModel()
    let locationManager = CLLocationManager ()

    
    //Pre-linked IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ALVTAG1")
        //click on imageview recognizer
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTappedGoToChangeCity(tapGestureRecognizer:)))
        weatherIcon.isUserInteractionEnabled = true
        weatherIcon.addGestureRecognizer(tapGestureRecognizer)
        
        
        
        //TODO:Set up the location manager here.
        locationManager.delegate = self
        // ALVTAG: this, in java, would be locationManager.setListener(this);
        //          with this class being
        //              WeatherViewController extends UIViewController implements CLLocationManagerDelegate
        // delegate s
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization() //rather than always- unless you need it
        locationManager.startUpdatingLocation()
    }
    
    
    @objc
    func imageTappedGoToChangeCity(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let _ = tapGestureRecognizer.view as! UIImageView
        
        // Your action
        print("image clicked! whoo")
        performSegue(withIdentifier: "changeCityName", sender: nil)
    }
    //MARK: - Networking
    /***************************************************************/
    //Write the getWeatherData method here:
    
    func fetchData(dict: [String:String]){
        print("ALVTAG2")
        //print("lat about to send: \(dict["l at"]) ")
        Alamofire.request(WEATHER_URL, method: .get, parameters:dict)
            .responseJSON{
                response in
                if response.result.isSuccess{
                    if let weatherValue = response.result.value {
                        let weatherJson:JSON = JSON(weatherValue)
                        self.updateWeatherData(json:weatherJson)
                        self.updateUIWithWeatherData()
                    }
                        
                    else{
                        if let error2 = response.error {
                            self.cityLabel.text =
                            "network Error:\(error2.localizedDescription)"
                        }
                        else{
                            self.cityLabel.text = "network Error!"
                        }
                    }
                }
        }
    }
    
    //MARK: - JSON Parsing
    /***************************************************************/
   
    
    //Write the updateWeatherData method here:
    func updateWeatherData(json:JSON){
        print(json )
        
        weatherDataModel.temperature = Int( json["main"]["temp"].doubleValue-273.15)
    
        weatherDataModel.city = json["name"].stringValue
        print(weatherDataModel.city)
        weatherDataModel.condition = json["weather"][0]["id"].intValue
        
        weatherDataModel.weatherIconName =
            weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition, betterFoo: SomeClassWithFunction())
    }

    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //Write the updateUIWithWeatherData method here:
    
    func updateUIWithWeatherData(){
        cityLabel.text = weatherDataModel.city
        temperatureLabel.text = String(weatherDataModel.temperature)
        weatherIcon.image = UIImage(named:weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition, betterFoo: SomeClassWithFunction()))
    }
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //Write the didUpdateLocations method here:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count-1];
        if(location.horizontalAccuracy > 0){
            self.locationManager.stopUpdatingLocation() // almost always do this after gettig a read- saves power.
            print ("long = \(location.coordinate.longitude)  lat = \(location.coordinate.latitude)")

            let params:[String:String] = ["lat":String(location.coordinate.latitude),
                                          "lon":String(location.coordinate.longitude),
                                          "appid":APP_ID]
            fetchData(dict:params);
        }
    }
    
    
    //Write the didFailWithError method here:
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("alvtag aaa")
        cityLabel.text = "location Unavailable:\("error.localizedDescription")"
    }
    

    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //Write the userEnteredANewCityName Delegate method here:
    func onCityChanged(city: String) {
        print("change city to \(city)")
        let params:[String:String] = ["q":city,
                                      "appid":APP_ID]
        fetchData(dict:params);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeCityName" {
            let destinationVC = segue.destination as! ChangeCityViewController
            destinationVC.param = weatherDataModel.city;
            destinationVC.changeCityDelegate = self
        }
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        super.performSegue(withIdentifier: identifier, sender: sender)
    }
    
    
}


