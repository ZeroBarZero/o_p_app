//
//  studyDetail_M.swift
//  o_p_app
//
//  Created by LEE HAEUN on 2019. 6. 1..
//  Copyright © 2019년 haeun. All rights reserved.
//

import Foundation

public class StudyDetailModel {
    public let title : String
    public let description : String
    public let location : String
    public let correntMember : String
    public let maxMember : String
    public let week: String
    
    init(title : String, description : String,
         location : String, correntMember : String, maxMember : String, week : String) {
        self.title = title
        self.description = description
        self.location = location
        self.correntMember = correntMember
        self.maxMember = maxMember
        self.week = week
    }
}
