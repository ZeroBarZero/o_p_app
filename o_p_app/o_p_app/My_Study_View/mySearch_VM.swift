//
//  mySearch_VM.swift
//  o_p_app
//
//  Created by OOPSLA on 17/03/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit

public class mySearch_M {
    public let studyTitle : String
    public let studydescription : String
    public let studyMember : String
    public let studyOnlineOrOffline : String
    public let studyLocation : String
    
    public init(studyTitle : String,
                studydescription : String,
                studyMember :String,
                studyOnlineOrOffline : String,
                studyLocation:String){
        self.studyTitle = studyTitle
        self.studydescription = studydescription
        self.studyMember = studyMember
        self.studyOnlineOrOffline = studyOnlineOrOffline
        self.studyLocation = studyLocation
    }
}

class mySearch_VM {
    private let mySearch_m : mySearch_M
    public init(mySearch_m : mySearch_M){
        self.mySearch_m = mySearch_m
    }
    
    public var studyTitle : String {
        return mySearch_m.studyTitle
    }
    public var studydescription : String{
        return mySearch_m.studydescription
    }
    public var studyMember : String {
        return mySearch_m.studyMember
    }
    public var studyOnlineOrOffline :String {
        return mySearch_m.studyOnlineOrOffline
    }
    public var studyLocation : String {
        return mySearch_m.studyLocation
    }
}
