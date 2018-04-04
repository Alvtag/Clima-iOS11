//
//  ChangeCityViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit


//Write the protocol declaration here:

protocol ChangeCityDelegate{
    func onCityChanged(city:String)
}


class ChangeCityViewController: UIViewController {
    
    
    var param = "";
    var changeCityDelegate: ChangeCityDelegate?
    
    
    @IBOutlet weak var changeCityTextField: UITextField!

    override func viewDidLoad(){
        changeCityTextField.text = param;
    }
    //This is the IBAction that gets called when the user taps on the "Get Weather" button:
    @IBAction func getWeatherPressed(_ sender: AnyObject) {
        if let newCityValue = changeCityTextField.text {
            changeCityDelegate?.onCityChanged(city:newCityValue)
        }
        dismiss(animated: true){}
    }
    
    

    //This is the IBAction that gets called when the user taps the back button. It dismisses the ChangeCityViewController.
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
