//
//  SomeClassWithFunction.swift
//  Clima
//
//  Created by Alvin Fong on 2018-04-03.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

func thisFuncShouldBeMocked(){
    print("111- this global function cannot be overriden" +
        ", and cannot be mocked, sorry! ")
    
}

class SomeClassWithFunction{
    
    func thisMethodShouldBeMocked(){
        print("222- If you can read this you're doing it wrong")
    }
}
