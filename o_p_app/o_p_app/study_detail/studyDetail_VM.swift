//
//  studyDetail_VM.swift
//  o_p_app
//
//  Created by OOPSLA on 20/03/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation

public class studyDetailViewModel {
    private let studyDetailModel : StudyDetailModel
    
    public init(studyDetailModel : StudyDetailModel){
        self.studyDetailModel = studyDetailModel
    }
    
    public var title : String {
        return studyDetailModel.title
    }
    public var description : String {
        return studyDetailModel.title
    }
    public var location : String {
        return studyDetailModel.title
    }
    public var member : String {
        return "\(studyDetailModel.correntMember)명 / \(studyDetailModel.maxMember)명"
    }
    public var week : String {
        return studyDetailModel.week
    }
}
