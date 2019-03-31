//
//  add_Study_V_2.swift
//  o_p_app
//
//  Created by OOPSLA on 30/03/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit
import FlexibleSteppedProgressBar
import TextFieldEffects
import AnimatedTextInput
import IQKeyboardManagerSwift

class add_Study_V_2 : UIView, FlexibleSteppedProgressBarDelegate {
    var progressBar: FlexibleSteppedProgressBar!
    var progressBarWithoutLastState: FlexibleSteppedProgressBar!
    
    // 선택 동그라미 색
    var backgroundColor1 = #colorLiteral(red: 0.09955967218, green: 0.5711624026, blue: 0.4547557235, alpha: 1)
    // 동그라미 색
    var progressColor = Defaull_style.themeColor
    // 위아래 설명 색
    var textColorHere = UIColor(red: 153.0 / 255.0, green: 153.0 / 255.0, blue: 153.0 / 255.0, alpha: 1.0)
    
    var maxIndex = -1
    
    var heightConstraint : NSLayoutConstraint?

    override init(frame: CGRect) {
        super.init(frame: frame)
        heightConstraint = self.week_selectView.heightAnchor.constraint(equalToConstant: 0)
        heightConstraint?.isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        self.backgroundColor = .white
        IQKeyboardManager.shared.enable = true
        
        setupProgressBarWithoutLastState()
        
        self.addSubview(progressBarWithoutLastState)
        // 기본 정보
        self.addSubview(descriptionLabel_1)
        self.addSubview(studyTitleTextInput)
        self.addSubview(studyInfoTextInput)
        // 디테일 작성
        self.addSubview(descriptionLabel_2)
        self.addSubview(week_selection)
        week_selection.tapAction = {
            
            if self.week_selectView.isHidden {
                self.week_selectView.isHidden = false
                self.heightConstraint?.isActive = false
                self.heightConstraint = self.week_selectView.heightAnchor.constraint(equalToConstant: 420)
                self.heightConstraint?.isActive = true
                UIView.animate(withDuration: 1, animations: {
                    self.week_selectView.layoutIfNeeded()
                }, completion: nil)

            }else {
                self.week_selectView.isHidden = true
                self.heightConstraint?.isActive = false
                self.heightConstraint = self.week_selectView.heightAnchor.constraint(equalToConstant: 0)
                self.heightConstraint?.isActive = true
                UIView.animate(withDuration: 1, animations: {
                    self.week_selectView.layoutIfNeeded()
                }, completion: nil)

            }
        }
        self.addSubview(week_selectView)
        
        self.addSubview(member_selection)
        member_selection.tapAction = {
            
        }
        self.addSubview(location_selection)
        location_selection.tapAction = {
            
        }

        
        //        self.addSubview(bottomView)
        
        _ = Int(self.frame.height/8)
        
        
        NSLayoutConstraint.activate([
            
            //            bottomView.heightAnchor.constraint(equalToConstant: CGFloat(height)),
            //            bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            //            bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            //            bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            //
            
            progressBarWithoutLastState.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            progressBarWithoutLastState.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            progressBarWithoutLastState.widthAnchor.constraint(equalToConstant: self.frame.width - 40),
            progressBarWithoutLastState.heightAnchor.constraint(equalToConstant: 150),
            
            
            descriptionLabel_1.topAnchor.constraint(equalTo: progressBarWithoutLastState.bottomAnchor, constant: 10),
            descriptionLabel_1.leadingAnchor.constraint(equalTo: progressBarWithoutLastState.leadingAnchor, constant: 0),
            descriptionLabel_1.trailingAnchor.constraint(equalTo: progressBarWithoutLastState.trailingAnchor, constant: 0),
            
            
            studyTitleTextInput.topAnchor.constraint(equalTo: descriptionLabel_1.bottomAnchor, constant: 10),
            studyTitleTextInput.leadingAnchor.constraint(equalTo: progressBarWithoutLastState.leadingAnchor, constant: 0),
            studyTitleTextInput.trailingAnchor.constraint(equalTo: progressBarWithoutLastState.trailingAnchor, constant: 0),
            
            studyInfoTextInput.topAnchor.constraint(equalTo: studyTitleTextInput.bottomAnchor, constant: 10),
            studyInfoTextInput.leadingAnchor.constraint(equalTo: progressBarWithoutLastState.leadingAnchor, constant: 0),
            studyInfoTextInput.trailingAnchor.constraint(equalTo: progressBarWithoutLastState.trailingAnchor, constant: 0),
            
            
            descriptionLabel_2.topAnchor.constraint(equalTo: studyInfoTextInput.bottomAnchor, constant: 30),
            descriptionLabel_2.leadingAnchor.constraint(equalTo: progressBarWithoutLastState.leadingAnchor, constant: 0),
            descriptionLabel_2.trailingAnchor.constraint(equalTo: progressBarWithoutLastState.trailingAnchor, constant: 0),
            
            week_selection.topAnchor.constraint(equalTo: descriptionLabel_2.bottomAnchor, constant: 10),
            week_selection.leadingAnchor.constraint(equalTo: progressBarWithoutLastState.leadingAnchor, constant: 0),
            week_selection.trailingAnchor.constraint(equalTo: progressBarWithoutLastState.trailingAnchor, constant: 0),
            
            week_selectView.topAnchor.constraint(equalTo: week_selection.bottomAnchor, constant: 0),
            week_selectView.leadingAnchor.constraint(equalTo: progressBarWithoutLastState.leadingAnchor, constant: 0),
            week_selectView.trailingAnchor.constraint(equalTo: progressBarWithoutLastState.trailingAnchor, constant: 0),
            
            
            member_selection.topAnchor.constraint(equalTo: week_selectView.bottomAnchor, constant: 10),
            member_selection.leadingAnchor.constraint(equalTo: progressBarWithoutLastState.leadingAnchor, constant: 0),
            member_selection.trailingAnchor.constraint(equalTo: progressBarWithoutLastState.trailingAnchor, constant: 0),
            
            location_selection.topAnchor.constraint(equalTo: member_selection.bottomAnchor, constant: 10),
            location_selection.leadingAnchor.constraint(equalTo: progressBarWithoutLastState.leadingAnchor, constant: 0),
            location_selection.trailingAnchor.constraint(equalTo: progressBarWithoutLastState.trailingAnchor, constant: 0),
            location_selection.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
            
            ])

        
        
    }
    func setupProgressBarWithoutLastState() {
        
        progressBarWithoutLastState = FlexibleSteppedProgressBar()
        progressBarWithoutLastState.translatesAutoresizingMaskIntoConstraints = false
        
        // Customise the progress bar here
        progressBarWithoutLastState.centerLayerTextColor = UIColor.white
        progressBarWithoutLastState.backgroundShapeColor = #colorLiteral(red: 0.3898896277, green: 0.7629801631, blue: 0.6540151238, alpha: 1)
        progressBarWithoutLastState.numberOfPoints = 3
        progressBarWithoutLastState.lineHeight = 3
        progressBarWithoutLastState.radius = 20
        progressBarWithoutLastState.progressRadius = 25
        progressBarWithoutLastState.progressLineHeight = 3
        progressBarWithoutLastState.delegate = self
        progressBarWithoutLastState.selectedBackgoundColor = progressColor
        progressBarWithoutLastState.selectedOuterCircleStrokeColor = backgroundColor1
        progressBarWithoutLastState.currentSelectedCenterColor = progressColor
        progressBarWithoutLastState.stepTextColor = textColorHere
        progressBarWithoutLastState.currentSelectedTextColor = progressColor
        progressBarWithoutLastState.currentIndex = 0
        
    }
    let descriptionLabel_1 : UILabel = {
        let label = UILabel()
        //        label.backgroundColor = .red
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        label.text = "기본 정보"
        label.textColor = Defaull_style.mainTitleColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let  studyTitleTextInput : AnimatedTextInput = {
        let text = AnimatedTextInput()
        text.placeHolderText = "스터디명"
        text.translatesAutoresizingMaskIntoConstraints = false
        text.style = CustomTextInputStyle()
        //        text.type = .numeric
        return text
    }()
    let  studyInfoTextInput : AnimatedTextInput = {
        let text = AnimatedTextInput()
        text.placeHolderText = "스터디 정보"
        text.translatesAutoresizingMaskIntoConstraints = false
        text.style = CustomTextInputStyle()
        //        text.type = .numeric
        return text
    }()
    let descriptionLabel_2 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        label.text = "디테일 작성"
        label.textColor = Defaull_style.mainTitleColor
        return label
    }()
    
    let week_selection : AnimatedTextInput = {
        let select = AnimatedTextInput()
        select.translatesAutoresizingMaskIntoConstraints = false
        select.placeHolderText = "스터디 요일"
        select.type = .selection
        select.style = CustomTextInputStyle()
        return select
    }()
    
    let week_selectView : weekView = {
        let view = weekView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        //        view.backgroundColor = .red
        return view
    }()
    
    let member_selection : AnimatedTextInput = {
        let select = AnimatedTextInput()
        select.translatesAutoresizingMaskIntoConstraints = false
        select.placeHolderText = "최대 스터디원"
        select.type = .selection
        select.style = CustomTextInputStyle()
        
        select.tapAction = {
            print("tap")
        }
        return select
    }()
    
    let location_selection : AnimatedTextInput = {
        let select = AnimatedTextInput()
        select.translatesAutoresizingMaskIntoConstraints = false
        select.placeHolderText = "장소 선택"
        select.type = .selection
        select.style = CustomTextInputStyle()
        
        select.tapAction = {
            print("tap")
        }
        return select
    }()
    
    let bottomView : studyDetail_Bottom_V = {
        let view = studyDetail_Bottom_V()
        view.leftString = "스터디 생성 준비 완료"
        view.rightString = "등록"
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 4.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func progressBar(_ progressBar: FlexibleSteppedProgressBar,
                     textAtIndex index: Int, position: FlexibleSteppedProgressBarTextLocation) -> String {
        if progressBar == self.progressBar || progressBar == self.progressBarWithoutLastState {
            if position == FlexibleSteppedProgressBarTextLocation.top {
                switch index {
                    
                case 0: return "기본 정보"
                case 1: return "디테일 작성"
                case 2: return "완료"
                    //                case 3: return "Buy"
                //                case 4: return "Pay"
                default: return "Step"
                    
                }
            } else if position == FlexibleSteppedProgressBarTextLocation.bottom {
                switch index {
                    
                case 0: return "Step 1"
                case 1: return "Step 2"
                case 2: return "Step 3"
                    //                case 3: return "Fourth"
                //                case 4: return "Fifth"
                default: return "Date"
                    
                }
                
            } else if position == FlexibleSteppedProgressBarTextLocation.center {
                switch index {
                    
                case 0: return "1"
                case 1: return "2"
                case 2: return "3"
                case 3: return "4"
                case 4: return "5"
                default: return "0"
                    
                }
            }
        }
        return ""
    }
    
}

class weekView : UIView , UITableViewDelegate, UITableViewDataSource{
    let weekStr = ["월","화","수","목","금","토","일"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weekStr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = weekStr[indexPath.row]
        //        print(weekStr[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
            ])
        //        print(tableView.frame.height)
    }
    
    let tableView : UITableView = {
        let table = UITableView()
        table.backgroundColor = .blue
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
}

class weekView_TV_Cell : UITableViewCell {
    let weekLabel : UILabel = {
       let label = UILabel()
        return label
    }()
    let detailLocationLabel : UILabel = {
        let label = UILabel()
        label.textColor = Defaull_style.mainTitleColor
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = "시간 선택"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

struct CustomTextInputStyle: AnimatedTextInputStyle {
    let placeholderInactiveColor = Defaull_style.themeColor
    let activeColor = Defaull_style.themeColor
    let inactiveColor = UIColor.gray.withAlphaComponent(0.3)
    let lineInactiveColor = UIColor.gray.withAlphaComponent(0.3)
    let lineActiveColor = Defaull_style.themeColor
    // 아래 라인 높이
    let lineHeight: CGFloat = 1
    let errorColor = UIColor.red
    let textInputFont = UIFont.systemFont(ofSize: 15)
    let textInputFontColor = UIColor.black
    let placeholderMinFontSize: CGFloat = 12
    let counterLabelFont: UIFont? = UIFont.systemFont(ofSize: 12)
    let leftMargin: CGFloat = 5
    let topMargin: CGFloat = 30
    let rightMargin: CGFloat = 0
    let bottomMargin: CGFloat = 10
    let yHintPositionOffset: CGFloat = 7
    let yPlaceholderPositionOffset: CGFloat = 0
    public let textAttributes: [String: Any]? = nil
}
