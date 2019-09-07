//
//  UserInformation.swift
//  PennApps
//
//  Created by Steven QU on 9/7/19.
//  Copyright © 2019 Helen Dong. All rights reserved.
//

import UIKit

class UserInformation: NSObject {
    var information: [String] //array of name, number, disaster, additional comments
    
    init(information: [String]) {
        self.information = information
        super.init()
    }
    
    func getInformation() -> [String]{
        return information
    }
    
    func setInformation(information: [String]) {
        self.information = information
    }
}
