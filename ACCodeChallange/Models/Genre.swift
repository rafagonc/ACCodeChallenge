//
//  Genre.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 15, 2019

import Foundation
import SwiftyJSON


class Genre {

    var id : Int!
    var name : String!

	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        id = json["id"].intValue
        name = json["name"].stringValue
	}

}
