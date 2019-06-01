//
//  search_VM.swift
//  o_p_app
//
//  Created by OOPSLA on 17/03/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit

public class search_Model {
    // 사용자 이름
    public let name :String
    
    public init(name:String){
        self.name = name
    }
}
public class search_VM {
    // 이름
    private let search_M : search_Model
    
    public init(search : search_Model){
        self.search_M = search
    }
    public var name : String {
        return search_M.name
    }
}
