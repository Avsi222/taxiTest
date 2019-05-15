//
//  Cities.swift
//  TaxiTest
//
//  Created by Арсений Дорогин on 16/05/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import Foundation
import SwiftyJSON

//"city_id": 1, "city_name": "Москва", "city_latitude": 55.75577164, "city_longitude": 37.6177597, "city_spn_latitude": 0.96495301, "city_spn_longitude": 2.75756788, "last_app_android_version": 7045, "transfers": true, "client_email_required": true, "registration_promocode": true

class cities{
    var city_id = 0
    var city_name = ""
    var city_latitude:Double = 0.0
    var city_longtitude:Double = 0.0
    var city_spn_latitude:Double = 0.0
    var city_spn_longtitude:Double = 0.0
    var last_app_android_version = 0
    var transfers = true
    var client_email_required = true
    var registration_promocode = true
    
    init(json:JSON){
        city_id = json["city_id"].intValue
        city_name = json["city_name"].stringValue
        city_latitude = json["city_latitude"].doubleValue
        city_longtitude = json["city_longitude"].doubleValue
        city_spn_latitude = json["city_spn_latitude"].doubleValue
        city_spn_longtitude = json["city_spn_longitude"].doubleValue
        last_app_android_version = json["last_app_android_version"].intValue
        transfers = json["transfers"].boolValue
        client_email_required = json["client_email_required"].boolValue
        registration_promocode = json["registration_promocode"].boolValue
    }
    
    
}
