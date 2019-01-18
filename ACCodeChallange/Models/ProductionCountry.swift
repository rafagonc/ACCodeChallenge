//
//  ProductionCountry.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 15, 2019

import Foundation
import SwiftyJSON


class ProductionCountry {

    var iso31661 : String!
    var name : String!

	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        iso31661 = json["iso_3166_1"].stringValue
        name = json["name"].stringValue
	}
}
