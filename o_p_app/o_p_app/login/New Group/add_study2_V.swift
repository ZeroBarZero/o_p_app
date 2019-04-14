//
//  add_study2_V.swift
//  o_p_app
//
//  Created by OOPSLA on 14/04/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit
import AnimatedTextInput

class add_study2_V_step1 : UIView {
    
    let leadingPadding = CGFloat(20)
    var delegate : add_study2_VC_Delegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        initView()
    }
    
    @objc func step1_Next(){  delegate?.step1_Next()  }
    func initView(){
        self.addSubview(step1_First)
        self.backgroundColor = .white
        step1_First.addSubview(descriptionLabel_1)
        step1_First.addSubview(studyTitleTextInput)
        step1_First.addSubview(studyInfoTextInput)
        step1_First.addSubview(next1_Btn)

        next1_Btn.addTarget(nil, action: #selector(step1_Next), for: .touchDown)
        
        NSLayoutConstraint.activate([
            
            step1_First.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            step1_First.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingPadding),
            step1_First.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -leadingPadding),
            
            descriptionLabel_1.topAnchor.constraint(equalTo: step1_First.topAnchor, constant: 0),
            descriptionLabel_1.leadingAnchor.constraint(equalTo: step1_First.leadingAnchor, constant: 0),
            descriptionLabel_1.trailingAnchor.constraint(equalTo: step1_First.trailingAnchor, constant: 0),
            
            studyTitleTextInput.topAnchor.constraint(equalTo: descriptionLabel_1.bottomAnchor, constant: 10),
            studyTitleTextInput.leadingAnchor.constraint(equalTo: step1_First.leadingAnchor, constant: 0),
            studyTitleTextInput.trailingAnchor.constraint(equalTo: step1_First.trailingAnchor, constant: 0),
            
            studyInfoTextInput.topAnchor.constraint(equalTo: studyTitleTextInput.bottomAnchor, constant: 10),
            studyInfoTextInput.leadingAnchor.constraint(equalTo: step1_First.leadingAnchor, constant: 0),
            studyInfoTextInput.trailingAnchor.constraint(equalTo: step1_First.trailingAnchor, constant: 0),
            
            next1_Btn.topAnchor.constraint(equalTo: studyInfoTextInput.bottomAnchor, constant: 10),
            next1_Btn.trailingAnchor.constraint(equalTo: step1_First.trailingAnchor, constant: 0),
            next1_Btn.widthAnchor.constraint(equalToConstant: self.frame.width / 2 - 40),
            next1_Btn.heightAnchor.constraint(equalToConstant: 50),
            next1_Btn.bottomAnchor.constraint(equalTo: step1_First.bottomAnchor, constant: 0),
            ])
    }
    let step1_First : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //        view.backgroundColor = .gray
        return view
    }()

    let descriptionLabel_1 : UILabel = {
        let label = UILabel()
        //        label.backgroundColor = .red
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Step 1 . 기본 정보 입력"
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
        text.type = .multiline
        return text
    }()
    
    let next1_Btn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0, green: 0.6043059826, blue: 0.614680171, alpha: 1)
        button.isEnabled = false
        button.setTitle("정보를 입력해주세요.", for: .disabled)
        button.setTitle("다음", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        button.layer.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
        return button
    }()

}
class add_study2_V_step2 : UIView {
    
    let leadingPadding = CGFloat(20)
    var delegate : add_study2_VC_Delegate?

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
        initView()
    }
    @objc func step2_Next(){delegate?.step2_Next()}
    @objc func step2_Prev(){delegate?.step2_Prev()}
    
    func initView(){
//        self.backgroundColor = .blue

//        week_selectView.isHidden = true
//        location_View.isHidden = true

//        week_selectView.delegate = self.delegate
        self.addSubview(scrollView)
        scrollView.addSubview(step2View)
        // 디테일 작성
        step2View.addSubview(descriptionLabel_2)
        step2View.addSubview(week_selection)
        // 장소 선택
        location_View.addArrangedSubview(onlineBtn)
        location_View.addArrangedSubview(offlineBtn)
        step2View.addSubview(location_View)
        step2View.addSubview(week_selectView)
        
        step2View.addSubview(member_selection)
        step2View.addSubview(location_selection)
        
        pre_Next_Stack_SuperView.addSubview(pre_Next_Stack)
        step2View.addSubview(pre_Next_Stack_SuperView)
        
        pre_Next_Stack.addArrangedSubview(previous_Btn)
        previous_Btn.addTarget(nil, action: #selector(step2_Prev), for: .touchDown)
        pre_Next_Stack.addArrangedSubview(next_Btn)
        next_Btn.addTarget(nil, action: #selector(step2_Next), for: .touchDown)
        
        next_Btn.isEnabled = true
        
        week_selection.tapAction = {
            print("tap")
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
        member_selection.tapAction = {
            self.delegate?.step2_memberSelectView()
        }
        location_selection.tapAction = {
            if self.location_View.isHidden {
                self.location_View.isHidden = false
                self.locationHeightconstraint?.isActive = false
                self.locationHeightconstraint = self.location_View.heightAnchor.constraint(equalToConstant: 50)
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
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            step2View.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            step2View.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingPadding),
            step2View.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -leadingPadding),
            step2View.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            
            descriptionLabel_2.topAnchor.constraint(equalTo: step2View.topAnchor, constant: 0),
            descriptionLabel_2.leadingAnchor.constraint(equalTo: step2View.leadingAnchor, constant: 0),
            descriptionLabel_2.trailingAnchor.constraint(equalTo: step2View.trailingAnchor, constant: 0),
            
            week_selection.topAnchor.constraint(equalTo: descriptionLabel_2.bottomAnchor, constant: 10),
            week_selection.leadingAnchor.constraint(equalTo: step2View.leadingAnchor, constant: 0),
            week_selection.trailingAnchor.constraint(equalTo: step2View.trailingAnchor, constant: 0),
            
            week_selectView.topAnchor.constraint(equalTo: week_selection.bottomAnchor, constant: 0),
            week_selectView.leadingAnchor.constraint(equalTo: step2View.leadingAnchor, constant: 0),
            week_selectView.trailingAnchor.constraint(equalTo: step2View.trailingAnchor, constant: 0),
            
            
            member_selection.topAnchor.constraint(equalTo: week_selectView.bottomAnchor, constant: 10),
            member_selection.leadingAnchor.constraint(equalTo: step2View.leadingAnchor, constant: 0),
            member_selection.trailingAnchor.constraint(equalTo: step2View.trailingAnchor, constant: 0),
            
            location_selection.topAnchor.constraint(equalTo: member_selection.bottomAnchor, constant: 10),
            location_selection.leadingAnchor.constraint(equalTo: step2View.leadingAnchor, constant: 0),
            location_selection.trailingAnchor.constraint(equalTo: step2View.trailingAnchor, constant: 0),
            //            location_selection.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
            
            location_View.topAnchor.constraint(equalTo: location_selection.bottomAnchor, constant: 10),
            location_View.leadingAnchor.constraint(equalTo: step2View.leadingAnchor, constant: +10),
            location_View.trailingAnchor.constraint(equalTo: step2View.trailingAnchor, constant: -10),
            //            location_View.bottomAnchor.constraint(equalTo: step2View.bottomAnchor, constant: 0),
            
            pre_Next_Stack_SuperView.topAnchor.constraint(equalTo: location_View.bottomAnchor, constant: 10),
            pre_Next_Stack_SuperView.leadingAnchor.constraint(equalTo: step2View.leadingAnchor, constant: 0),
            pre_Next_Stack_SuperView.trailingAnchor.constraint(equalTo: step2View.trailingAnchor, constant: 0),
            //            pre_Next_Stack_SuperView.widthAnchor.constraint(equalToConstant: view.frame.width / 2 - 40),
            pre_Next_Stack_SuperView.heightAnchor.constraint(equalToConstant: 50),
            pre_Next_Stack_SuperView.bottomAnchor.constraint(equalTo: step2View.bottomAnchor, constant: 0),
            
            pre_Next_Stack.topAnchor.constraint(equalTo: pre_Next_Stack_SuperView.topAnchor, constant: 0),
            pre_Next_Stack.leadingAnchor.constraint(equalTo: pre_Next_Stack_SuperView.leadingAnchor, constant: 0),
            pre_Next_Stack.trailingAnchor.constraint(equalTo: pre_Next_Stack_SuperView.trailingAnchor, constant: 0),
            pre_Next_Stack.bottomAnchor.constraint(equalTo: pre_Next_Stack_SuperView.bottomAnchor, constant: 0),
            

            ])
        
    }
    let scrollView : UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    let step2View : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let descriptionLabel_2 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Step 2 . 디테일 작성"
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
        select.placeHolderText = "스터디 방식 선택"
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
        view.alignment = .fill
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
    let pre_Next_Stack_SuperView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.layer.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
        view.clipsToBounds = true
        return view
    }()
    let pre_Next_Stack: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .fill
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.backgroundColor = .blue
        return view
    }()
    
    let previous_Btn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 1, green: 0.3768762648, blue: 0.6086360216, alpha: 1)
        button.setTitle("이전", for: .normal)
        //        button.isEnabled = false
        //        button.setTitle("정보를 입력해주세요.", for: .disabled)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        return button
    }()
    let next_Btn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0, green: 0.6043059826, blue: 0.614680171, alpha: 1)
        button.isEnabled = false
        button.setTitle("정보를 입력해주세요.", for: .disabled)
        button.setTitle("다음", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        return button
    }()
    let step3View : UIView = {
        let view = UIView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

}
class add_study2_V_step3 : UIView {
    
    let leadingPadding = CGFloat(20)
    var delegate : add_study2_VC_Delegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        initView()
    }

    @objc func step3_Next(){delegate?.step3_Next()}
    @objc func step3_Prev(){delegate?.step3_Prev()}

    func initView() {
        

        step3View.addSubview(step3_label)
        step3View.addSubview(big_Label)
        
        pre_Next_Stack_SuperView3.addSubview(pre_Next_Stack3)
        step3View.addSubview(pre_Next_Stack_SuperView3)
        
        pre_Next_Stack3.addArrangedSubview(previous_Btn3)
        previous_Btn3.addTarget(nil, action: #selector(step3_Prev), for: .touchDown)
        pre_Next_Stack3.addArrangedSubview(complete_Btn3)
        complete_Btn3.addTarget(nil, action: #selector(step3_Next), for: .touchDown)
        
        self.addSubview(step3View)
        
        NSLayoutConstraint.activate([
            step3View.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            step3View.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingPadding),
            step3View.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -leadingPadding),
            step3View.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            step3_label.topAnchor.constraint(equalTo: step3View.topAnchor, constant: 0),
            step3_label.leadingAnchor.constraint(equalTo: step3View.leadingAnchor, constant: 0),
            step3_label.trailingAnchor.constraint(equalTo: step3View.trailingAnchor, constant: 0),
            
            big_Label.centerXAnchor.constraint(equalTo: step3View.centerXAnchor, constant: 0),
            big_Label.centerYAnchor.constraint(equalTo: step3View.centerYAnchor, constant: 0),
            
            pre_Next_Stack_SuperView3.topAnchor.constraint(equalTo: big_Label.bottomAnchor, constant: 10),
            pre_Next_Stack_SuperView3.leadingAnchor.constraint(equalTo: step3View.leadingAnchor, constant: 0),
            pre_Next_Stack_SuperView3.trailingAnchor.constraint(equalTo: step3View.trailingAnchor, constant: 0),
            //            pre_Next_Stack_SuperView.widthAnchor.constraint(equalToConstant: view.frame.width / 2 - 40),
            pre_Next_Stack_SuperView3.heightAnchor.constraint(equalToConstant: 50),
//            pre_Next_Stack_SuperView3.bottomAnchor.constraint(equalTo: step3View.bottomAnchor, constant: 0),
            
            pre_Next_Stack3.widthAnchor.constraint(equalTo: pre_Next_Stack_SuperView3.widthAnchor, constant: 0),
            pre_Next_Stack3.heightAnchor.constraint(equalTo: pre_Next_Stack_SuperView3.heightAnchor, constant: 0),
            
            
            ])
    }
    let step3View : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let step3_label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Step 3 . 완성"
//        label.backgroundColor = .blue
        label.textColor = Defaull_style.mainTitleColor
        return label
    }()
    
    let big_Label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.text = "✧*｡٩(ˊᗜˋ*)و✧*｡"
        label.textColor = Defaull_style.mainTitleColor
        return label
    }()
    let pre_Next_Stack_SuperView3 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.layer.cornerRadius = CGFloat(Defaull_style.insideTableViewCorner)
        view.clipsToBounds = true
        return view
    }()
    let pre_Next_Stack3: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .fill
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.backgroundColor = .blue
        return view
    }()
    
    let previous_Btn3 : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 1, green: 0.3768762648, blue: 0.6086360216, alpha: 1)
        button.setTitle("이전", for: .normal)
        //        button.isEnabled = false
        //        button.setTitle("정보를 입력해주세요.", for: .disabled)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        return button
    }()
    let complete_Btn3 : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0, green: 0.6043059826, blue: 0.614680171, alpha: 1)
        button.setTitle("완료!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        return button
    }()
    

}
