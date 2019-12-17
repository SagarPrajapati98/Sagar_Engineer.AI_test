//
//  Constants.swift
//  Sagar_Engineet.AI_Test
//
//  Created by pcq196 on 17/12/19.
//  Copyright © 2019 pcq196. All rights reserved.
//

import Foundation

var BASEURL:String = "https://hn.algolia.com/api/"

struct API {
    static var getpostlist:String = BASEURL + "v1/search_by_date?tags=story&page="
}
