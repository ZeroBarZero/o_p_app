//
//  offlineSearch_VM.swift
//  o_p_app
//
//  Created by OOPSLA on 17/04/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct receiveJson {
    let jibun_address : String
    let name : String
    let x : String
    let y : String
}

class offlineSearch_VM {
    
    let ClientID = "kf5waz8f2e"
    let ClientSecret = "P2uO4r61I4ViAo4EviCwaTdUr1WHgHBlkgysKFRP"
    let defaultURLFirst = "https://naveropenapi.apigw.ntruss.com/map-place/v1/search?query="
    let defaultURLSecond = "&coordinate="
    
    let testCoordiate = "126.942517,37.514119"

    static func parse(json : Any) -> [receiveJson] {
        var receiveArr = [receiveJson]()

        if let Json = json as? [String:Any] {
            guard let items = Json["places"] as? [[String: Any]]  else {
                return []
            }
//            print(Json)
            
            items.forEach{
                guard let jibun = $0["jibun_address"] as? String,
                    let name = $0["name"] as? String,
                    let x = $0["x"] as? String,
                    let y = $0["y"] as? String
                    else {
                        return
                }
                receiveArr.append(receiveJson(jibun_address: jibun, name: name, x: x, y: y))
            }
        }
        return receiveArr
    }
}
