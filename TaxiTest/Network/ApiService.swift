//
//  ApiService.swift
//  TaxiTest
//
//  Created by Арсений Дорогин on 16/05/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import Alamofire
import SwiftyJSON

class apiService{
    
    static var baseUrl = "https://beta.taxistock.ru/taxik/api/"
    static var path = "test/"
    
    class func loadCities(completition:(([cities]?, Error?) -> Void)? = nil ){
 
        Alamofire.request(baseUrl + path, method: .get, parameters: nil).responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                print(error.localizedDescription)
                completition?(nil,error)
            case .success(let value):
                print(value)
                var citiesArray = [cities]()
                let json = JSON(value)
                
                _ = json["cities"].arrayValue.map {
                    let city = cities(json: $0)
                    citiesArray.append(city)
                    
                }
                completition?(citiesArray,nil)
            }
        }
    }
}
