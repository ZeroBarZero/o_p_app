//
//  add_Study_V.swift
//  o_p_app
//
//  Created by OOPSLA on 24/03/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit
import FlexibleSteppedProgressBar
import TextFieldEffects
import AnimatedTextInput
import IQKeyboardManagerSwift

// collectionView Cell 클릭한 index알기
protocol add_study_V_CVCDelegate : class {
    func add_study_V_CVCDelegateDidTap(index : IndexPath)
    
}


class add_Study_V : UIView,FlexibleSteppedProgressBarDelegate,add_study_V_CVCDelegate,UIPickerViewDelegate, UIPickerViewDataSource {
    
    func add_study_V_CVCDelegateDidTap(index : IndexPath){
//        guard let tappedIndexPath = weekStackView.collectionview.indexPath(for: sender) else { return }
        let cellItem = weekStackView.collectionview.cellForItem(at: index) as! weekCollectionView_Cell
    
        cellItem.weekLabel.backgroundColor = Defaull_style.themeColor
        cellItem.weekLabel.textColor = .white
    }
    
    var progressBar: FlexibleSteppedProgressBar!
    var progressBarWithoutLastState: FlexibleSteppedProgressBar!

    // 선택 동그라미 색
    var backgroundColor1 = #colorLiteral(red: 0.09955967218, green: 0.5711624026, blue: 0.4547557235, alpha: 1)
    // 동그라미 색
    var progressColor = Defaull_style.themeColor
    // 위아래 설명 색
    var textColorHere = UIColor(red: 153.0 / 255.0, green: 153.0 / 255.0, blue: 153.0 / 255.0, alpha: 1.0)
    
    var maxIndex = -1

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = .white
        IQKeyboardManager.shared.enable = true

        initView()
    }
    func initView() {
        setupProgressBarWithoutLastState()
        addView()
        layoutInit()
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
    // 코드 추가 함수
    func addView(){
        self.addSubview(progressBarWithoutLastState)
        self.addSubview(descriptionLabel_1)
        self.addSubview(titleTextField)
        self.addSubview(descriptionTextField)
        self.addSubview(descriptionLabel_2)
        self.addSubview(weekStackView)
        self.addSubview(descriptionLabel_mini_1)
//        self.addSubview(descriptionLabel_mini_2)
        self.addSubview(memberTextField)
        self.addSubview(descriptionLabel_mini_3)
        self.addSubview(stackView)
        stackView.addArrangedSubview(locationBtn_1)
        stackView.addArrangedSubview(locationBtn_2)
//        self.addSubview(memberNumberPicker)
        
        weekStackView.delegate = self
        memberNumberPicker.delegate = self
        memberNumberPicker.dataSource = self

    }
    // 코드 레이아웃
    func layoutInit() {
        NSLayoutConstraint.activate([
            
            progressBarWithoutLastState.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            progressBarWithoutLastState.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            progressBarWithoutLastState.widthAnchor.constraint(equalToConstant: self.frame.width - 40),
            progressBarWithoutLastState.heightAnchor.constraint(equalToConstant: 150),

            descriptionLabel_1.topAnchor.constraint(equalTo: progressBarWithoutLastState.bottomAnchor, constant: 10),
            descriptionLabel_1.leadingAnchor.constraint(equalTo: progressBarWithoutLastState.leadingAnchor, constant: 0),
            descriptionLabel_1.trailingAnchor.constraint(equalTo: progressBarWithoutLastState.trailingAnchor, constant: 0),
            
            titleTextField.topAnchor.constraint(equalTo: descriptionLabel_1.bottomAnchor, constant: 0),
            titleTextField.leadingAnchor.constraint(equalTo: progressBarWithoutLastState.leadingAnchor, constant: 0),
            titleTextField.trailingAnchor.constraint(equalTo: progressBarWithoutLastState.trailingAnchor, constant: 0),
            
            titleTextField.heightAnchor.constraint(equalToConstant: 60),
            
            descriptionTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 0),
            descriptionTextField.leadingAnchor.constraint(equalTo: progressBarWithoutLastState.leadingAnchor, constant: 0),
            descriptionTextField.trailingAnchor.constraint(equalTo: progressBarWithoutLastState.trailingAnchor, constant: 0),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 60),
            
            
            descriptionLabel_2.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 40),
            descriptionLabel_2.leadingAnchor.constraint(equalTo: progressBarWithoutLastState.leadingAnchor, constant: 0),
            descriptionLabel_2.trailingAnchor.constraint(equalTo: progressBarWithoutLastState.trailingAnchor, constant: 0),
            
            descriptionLabel_mini_1.topAnchor.constraint(equalTo: descriptionLabel_2.bottomAnchor, constant: 10),
            descriptionLabel_mini_1.leadingAnchor.constraint(equalTo: progressBarWithoutLastState.leadingAnchor, constant: 0),
            descriptionLabel_mini_1.trailingAnchor.constraint(equalTo: progressBarWithoutLastState.trailingAnchor, constant: 0),
            
            weekStackView.topAnchor.constraint(equalTo: descriptionLabel_mini_1.bottomAnchor, constant: 10),
            weekStackView.leadingAnchor.constraint(equalTo: progressBarWithoutLastState.leadingAnchor, constant: 0),
            weekStackView.trailingAnchor.constraint(equalTo: progressBarWithoutLastState.trailingAnchor, constant: 0),
            weekStackView.heightAnchor.constraint(equalToConstant: 50),
            
//            descriptionLabel_mini_2.topAnchor.constraint(equalTo: weekStackView.bottomAnchor, constant: 10),
//            descriptionLabel_mini_2.leadingAnchor.constraint(equalTo: progressBarWithoutLastState.leadingAnchor, constant: 0),
//            descriptionLabel_mini_2.trailingAnchor.constraint(equalTo: progressBarWithoutLastState.trailingAnchor, constant: 0),
            
            memberTextField.topAnchor.constraint(equalTo: weekStackView.bottomAnchor, constant: 10),
            memberTextField.leadingAnchor.constraint(equalTo: progressBarWithoutLastState.leadingAnchor, constant: 0),
            memberTextField.trailingAnchor.constraint(equalTo: progressBarWithoutLastState.trailingAnchor, constant: 0),
            memberTextField.heightAnchor.constraint(equalToConstant: 50),
            
            descriptionLabel_mini_3.topAnchor.constraint(equalTo: memberTextField.bottomAnchor, constant: 10),
            descriptionLabel_mini_3.leadingAnchor.constraint(equalTo: progressBarWithoutLastState.leadingAnchor, constant: 0),
            descriptionLabel_mini_3.trailingAnchor.constraint(equalTo: progressBarWithoutLastState.trailingAnchor, constant: 0),
            
            stackView.topAnchor.constraint(equalTo: descriptionLabel_mini_3.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: progressBarWithoutLastState.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: progressBarWithoutLastState.trailingAnchor, constant: 0),
            stackView.heightAnchor.constraint(equalToConstant: 50),

//            memberNumberPicker.topAnchor.constraint(equalTo: descriptionLabel_mini_3.bottomAnchor, constant: 0),
//            memberNumberPicker.leadingAnchor.constraint(equalTo: progressBarWithoutLastState.leadingAnchor, constant: 0),
//            memberNumberPicker.trailingAnchor.constraint(equalTo: progressBarWithoutLastState.trailingAnchor, constant: 0),
            ])

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
    let titleTextField : HoshiTextField = {
        let textField = HoshiTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholderColor = Defaull_style.mainTitleColor
        textField.placeholder = "스터디명"
        textField.placeholderFontScale = 0.8
        textField.borderActiveColor = Defaull_style.themeColor
        textField.borderInactiveColor = Defaull_style.mainTitleColor
        return textField
    }()
    let descriptionTextField : HoshiTextField = {
        let textField = HoshiTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholderColor = Defaull_style.mainTitleColor
        textField.placeholder = "스터디 정보"
        textField.placeholderFontScale = 0.8
        textField.borderActiveColor = Defaull_style.themeColor
        textField.borderInactiveColor = Defaull_style.mainTitleColor
        return textField
    }()
    let descriptionLabel_2 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        label.text = "디테일 작성"
        label.textColor = Defaull_style.mainTitleColor
        return label
    }()
    let weekStackView : weekCollectionView = {
        let view = weekCollectionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let descriptionLabel_mini_1 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: (17 * 0.8), weight: .regular)
        label.text = "스터디 요일"
        label.textColor = Defaull_style.mainTitleColor
        return label
    }()
//    let descriptionLabel_mini_2 : UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = UIFont.systemFont(ofSize: (17 * 0.8), weight: .regular)
//        label.text = "최대 스터디원"
//        label.textColor = Defaull_style.mainTitleColor
//        return label
//    }()
    let memberTextField : HoshiTextField = {
        let textField = HoshiTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholderColor = Defaull_style.mainTitleColor
        textField.placeholder = "최대 스터디원"
        textField.placeholderFontScale = 0.8
        textField.borderActiveColor = Defaull_style.themeColor
        textField.borderInactiveColor = Defaull_style.mainTitleColor
        textField.keyboardType = .numberPad
        return textField
    }()
    let descriptionLabel_mini_3 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: (17 * 0.8), weight: .regular)
        label.text = "장소 선택"
        label.textColor = Defaull_style.mainTitleColor
        return label
    }()
    let memberBtn : UIButton = {
        let button = UIButton()
        button.titleLabel?.text = "스터디원 추가"
        return button
    }()
    var stackView : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 2
        return stack
    }()
    let locationBtn_1 : UIButton = {
        let button = UIButton()
        button.layer.borderColor = Defaull_style.subTitleColor.cgColor
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        button.layer.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
        button.setTitle("온라인", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.setTitleColor(Defaull_style.mainTitleColor, for: .normal)
        return button
    }()
    let locationBtn_2 : UIButton = {
        let button = UIButton()
        button.layer.borderColor = Defaull_style.subTitleColor.cgColor
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        button.layer.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
        button.setTitle("오프라인", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        button.setTitleColor(Defaull_style.mainTitleColor, for: .normal)

        return button
    }()

    
    let memberNumberPicker : UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .white
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    
    // MARK: UIPickerViewDataSource methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {   return 10   }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {   return "Row \(row)" }

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

class weekCollectionView : UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionview: UICollectionView!
    var delegate : add_study_V_CVCDelegate?
    let week = ["월","화","수","목","금","토","일"]

    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
//            print("test")
            return CGSize(width: collectionView.frame.width / 7, height: collectionView.frame.height)
        }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! weekCollectionView_Cell
        cell.weekLabel.text = week[indexPath.row]
//        print(week[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! weekCollectionView_Cell
        cell.backgroundColor = Defaull_style.themeColor
        print("select")
        delegate?.add_study_V_CVCDelegateDidTap(index: indexPath)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0

        layout.itemSize = CGSize(width: self.frame.width/7, height: self.frame.height)
        layout.scrollDirection = .horizontal
        
        collectionview = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height), collectionViewLayout: layout)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.register(weekCollectionView_Cell.self, forCellWithReuseIdentifier: "cell")
        //        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = UIColor.white
        self.addSubview(collectionview)

    }
}
class weekCollectionView_Cell : UICollectionViewCell {
//    let week = ["월","화","수","목","금","토","일"]

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() {
        self.addSubview(weekLabel)
//        weekLabel.backgroundColor = .red
        NSLayoutConstraint.activate([
            weekLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            weekLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            weekLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            weekLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            ])
    }
    var weekLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.borderColor = Defaull_style.subTitleColor.cgColor
        label.layer.borderWidth = 1
        label.clipsToBounds = true
        label.layer.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
//        label.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
//        label.setTitleColor(Defaull_style.mainTitleColor, for: .normal)
        return label
    }()
    
    
}
//
//class weekPicker : UIView {
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        self.addSubview(stackView)
//        NSLayoutConstraint.activate([
//            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
//            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
//            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
//            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
//            ])
//        stackView.addArrangedSubview(monBtn)
//        stackView.addArrangedSubview(tueBtn)
//        stackView.addArrangedSubview(wedBtn)
//        stackView.addArrangedSubview(turBtn)
//        stackView.addArrangedSubview(friBtn)
//        stackView.addArrangedSubview(satBtn)
//        stackView.addArrangedSubview(sunBtn)
//
//    }
//    var stackView : UIStackView = {
//        let stack = UIStackView()
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.axis = .horizontal
//        stack.distribution = .fillEqually
//        stack.spacing = 2
//        return stack
//    }()
//    @objc func touchEvent() {
//        print("touch")
//        monBtn.backgroundColor = Defaull_style.themeColor
//    }
//    // FIXIT : for 문으로 fix?
//    var monBtn : UIButton = {
//        let button = UIButton()
//        button.layer.borderColor = Defaull_style.subTitleColor.cgColor
//        button.layer.borderWidth = 1
//        button.layer.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
//        button.setTitleColor(Defaull_style.mainTitleColor, for: .normal)
//        button.addTarget(self, action: #selector(touchEvent), for: .touchDown)
//        button.setTitle("월", for: .normal)
//        return button
//    }()
//    var tueBtn : UIButton = {
//        let button = UIButton()
//        button.layer.borderColor = Defaull_style.subTitleColor.cgColor
//        button.layer.borderWidth = 1
//        button.layer.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
//
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
//        button.setTitleColor(Defaull_style.mainTitleColor, for: .normal)
//
//        button.setTitle("화", for: .normal)
//        return button
//    }()
//    var wedBtn : UIButton = {
//        let button = UIButton()
//        button.layer.borderColor = Defaull_style.subTitleColor.cgColor
//        button.layer.borderWidth = 1
//        button.layer.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
//        button.setTitleColor(Defaull_style.mainTitleColor, for: .normal)
//
//        button.setTitle("수", for: .normal)
//        return button
//    }()
//    var turBtn : UIButton = {
//        let button = UIButton()
//        button.layer.borderColor = Defaull_style.subTitleColor.cgColor
//        button.layer.borderWidth = 1
//        button.layer.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
//        button.setTitleColor(Defaull_style.mainTitleColor, for: .normal)
//
//        button.setTitle("목", for: .normal)
//        return button
//    }()
//    var friBtn : UIButton = {
//        let button = UIButton()
//        button.layer.borderColor = Defaull_style.subTitleColor.cgColor
//        button.layer.borderWidth = 1
//        button.layer.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
//        button.setTitleColor(Defaull_style.mainTitleColor, for: .normal)
//
//        button.setTitle("금", for: .normal)
//        return button
//    }()
//    var satBtn : UIButton = {
//        let button = UIButton()
//        button.layer.borderColor = Defaull_style.subTitleColor.cgColor
//        button.layer.borderWidth = 1
//        button.layer.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
//        button.setTitleColor(Defaull_style.mainTitleColor, for: .normal)
//
//        button.setTitle("토", for: .normal)
//        return button
//    }()
//    var sunBtn : UIButton = {
//        let button = UIButton()
//        button.layer.borderColor = Defaull_style.subTitleColor.cgColor
//        button.layer.borderWidth = 1
//        button.layer.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
//        button.setTitleColor(Defaull_style.mainTitleColor, for: .normal)
//
//        button.setTitle("일", for: .normal)
//        return button
//    }()
//
//}
//
