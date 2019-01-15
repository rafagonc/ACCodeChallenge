//
//  SpokenLanguage.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on January 15, 2019

import Foundation
import SwiftyJSON


class SpokenLanguage {

    var iso6391 : String!
    var name : String!

	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
        iso6391 = json["iso_639_1"].stringValue
        name = json["name"].stringValue
	}

}
