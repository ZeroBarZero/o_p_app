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

class add_Study_V_2 : UIView, FlexibleSteppedProgressBarDelegate,AnimatedTextInputDelegate {
    
    var delegate : add_study2_VC_Delegate?
    
    func animatedTextInputDidEndEditing(animatedTextInput: AnimatedTextInput) {
        if studyInfoTextInput.text != "" && studyTitleTextInput.text != "" {
            progressIndex = 1
            progressBarWithoutLastState.currentIndex = progressIndex
        }

    }
    
    var progressIndex = 0
    var progressBar: FlexibleSteppedProgressBar!
    var progressBarWithoutLastState: FlexibleSteppedProgressBar!

    // 선택 동그라미 색
    var backgroundColor1 = #colorLiteral(red: 1, green: 0.3768762648, blue: 0.6086360216, alpha: 1)
    // 동그라미 색
    var progressColor = Defaull_style.themeColor
    // 위아래 설명 색
    var textColorHere = UIColor(red: 153.0 / 255.0, green: 153.0 / 255.0, blue: 153.0 / 255.0, alpha: 1.0)
    
    var maxIndex = -1
    
    var heightConstraint : NSLayoutConstraint?
    var locationHeightconstraint : NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        heightConstraint = self.week_selectView.heightAnchor.constraint(equalToConstant: 0)
        heightConstraint?.isActive = true
        
        locationHeightconstraint = self.location_View.heightAnchor.constraint(equalToConstant: 0)
        locationHeightconstraint?.isActive = true

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
        studyTitleTextInput.delegate = self
        self.addSubview(studyInfoTextInput)
        studyInfoTextInput.delegate = self
        // 디테일 작성
        self.addSubview(descriptionLabel_2)
        self.addSubview(week_selection)
        // 장소 선택
        location_View.addArrangedSubview(onlineBtn)
        location_View.addArrangedSubview(offlineBtn)
        self.addSubview(location_View)

        week_selection.tapAction = {
            // height 변경하는 코드 텍스트 아래에 뷰 보이게 함
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
            print("tap")
            self.delegate?.step2_memberSelectView()
        }
        self.addSubview(location_selection)
        location_selection.tapAction = {
            if self.location_View.isHidden {
                self.location_View.isHidden = false
                self.locationHeightconstraint?.isActive = false
                self.locationHeightconstraint = self.location_View.heightAnchor.constraint(equalToConstant: 60)
                self.locationHeightconstraint?.isActive = true
                UIView.animate(withDuration: 1, animations: {
                    self.location_View.layoutIfNeeded()
                }, completion: nil)
                
            }else {
                self.location_View.isHidden = true
                self.locationHeightconstraint?.isActive = false
                self.locationHeightconstraint = self.location_View.heightAnchor.constraint(equalToConstant: 0)
                self.locationHeightconstraint?.isActive = true
                UIView.animate(withDuration: 1, animations: {
                    self.location_View.layoutIfNeeded()
                }, completion: nil)
            }

        }

        _ = Int(self.frame.height/8)
        
        
        NSLayoutConstraint.activate([
            
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
//            location_selection.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
            location_View.topAnchor.constraint(equalTo: location_selection.bottomAnchor, constant: 0),
            location_View.leadingAnchor.constraint(equalTo: progressBarWithoutLastState.leadingAnchor, constant: 0),
            location_View.trailingAnchor.constraint(equalTo: progressBarWithoutLastState.trailingAnchor, constant: 0),
            location_View.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
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
        progressBarWithoutLastState.currentIndex = progressIndex
        
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
    
    let location_View : UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        view.alignment = .center
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    let onlineBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = Defaull_style.themeColor
        btn.setTitle("온라인", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        return btn
    }()
    let offlineBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = Defaull_style.themeColor
        btn.setTitle("오프라인", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)

        return btn
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
class studyDaySelectView : UIView {
    
    let weekStr = ["월","화","수","목","금","토","일"]

    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initView(){
        self.backgroundColor = .white
        daySelectCollectionView.delegate = self
        daySelectCollectionView.dataSource = self
        daySelectCollectionView.register(daySelectCVCell.self, forCellWithReuseIdentifier: String(describing: daySelectCVCell.self))
            
        addSubview(daySelectCollectionView)
            
        NSLayoutConstraint.activate([
            daySelectCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            daySelectCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            daySelectCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            daySelectCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),

            ])
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        initView()
        let daySelectCVFlowLayout = UICollectionViewFlowLayout()
        daySelectCVFlowLayout.scrollDirection = .horizontal
        daySelectCVFlowLayout.itemSize = CGSize(width: self.frame.width/7, height:  self.frame.width/7)
        daySelectCollectionView = UICollectionView(frame: self.frame, collectionViewLayout: daySelectCVFlowLayout)
        
    }
    lazy var daySelectCollectionView : UICollectionView  = {
//        let daySelectCVFlowLayout = UICollectionViewFlowLayout()
//        daySelectCVFlowLayout.scrollDirection = .horizontal
//        daySelectCVFlowLayout.itemSize = CGSize(width: self.frame.width/7, height:  self.frame.width/7)
        let collect = UICollectionView()
        collect.translatesAutoresizingMaskIntoConstraints = false
        return collect
    }()
    
//    lazy var dayBaseTimeSelectTableView: UITableView  = {
//        let table = UITableView()
//        table.translatesAutoresizingMaskIntoConstraints = false
//        return table
//    }()
}
extension studyDaySelectView : UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: daySelectCVCell.self), for: indexPath) as! daySelectCVCell
        cell.dayLabel.text = weekStr[indexPath.row]
        return cell
    }
    
    
}
//extension studyDaySelectView : UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//
//}
class weekView : UIView , UITableViewDelegate, UITableViewDataSource{
    
    let weekStr = ["월","화","수","목","금","토","일"]
    var weekData = Array(repeating: "시간을 추가하세요.", count: 7)
//    var selectIndex : Int?
    
    var delegate : add_study2_VC_Delegate?


    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            let selectIndex = indexPath.row
            print(selectIndex)
            self.delegate?.step2_timeSelectView(index : selectIndex)

        }
//        let selectIndex = indexPath.row
//        print(selectIndex)
//        delegate?.step2_timeSelectView(index : selectIndex)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weekStr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! weekView_TV_Cell

        cell.weekLabel.text = weekStr[indexPath.row]
        cell.detailLocationLabel.text = weekData[indexPath.row]
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
        tableView.register(weekView_TV_Cell.self, forCellReuseIdentifier: "cell")
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(weekLabel)
        self.addSubview(weekLabelView)
        weekLabelView.addSubview(detailLocationLabel)
        
        let margin = CGFloat(Defaull_style.insideMargin)
        
        NSLayoutConstraint.activate([
                weekLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
                weekLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: margin),
                
                weekLabelView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
                weekLabelView.leadingAnchor.constraint(equalTo: weekLabel.trailingAnchor, constant: 0),
                weekLabelView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
                
                detailLocationLabel.centerYAnchor.constraint(equalTo: weekLabelView.centerYAnchor, constant: 0),
                detailLocationLabel.centerXAnchor.constraint(equalTo: weekLabelView.centerXAnchor, constant: 0),
                
            ])
    }
    let weekLabelView : UIView = {
        let view = UIView()
//        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let weekLabel : UILabel = {
       let label = UILabel()
        label.textColor = Defaull_style.mainTitleColor
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let detailLocationLabel : UILabel = {
        let label = UILabel()
        label.textColor = Defaull_style.whiteGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
//        label.backgroundColor = .red
        label.text = "시간 선택"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

struct CustomTextInputStyle: AnimatedTextInputStyle {
    let placeholderInactiveColor = Defaull_style.themeColor
    let activeColor = #colorLiteral(red: 1, green: 0.3768762648, blue: 0.6086360216, alpha: 1)
    let inactiveColor = #colorLiteral(red: 1, green: 0.3768762648, blue: 0.6086360216, alpha: 1)
    let lineInactiveColor = Defaull_style.themeColor
    let lineActiveColor = #colorLiteral(red: 1, green: 0.3768762648, blue: 0.6086360216, alpha: 1)
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
