//
//  offlineSearch_VC.swift
//  o_p_app
//
//  Created by OOPSLA on 17/04/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift


class offlineSearch_VC : UIViewController {
    var searchText : String?
    var disposeBag = DisposeBag()
    var offlineVM = offlineSearch_VM()
    
//    let ClientID = "네이버에서 제공받은 clientID"
//    let ClientSecret = "네이버에서 제공받은 clientSecret"

    let ClientID = "kf5waz8f2e"
    let ClientSecret = "P2uO4r61I4ViAo4EviCwaTdUr1WHgHBlkgysKFRP"
    let defaultURLFirst = "https://naveropenapi.apigw.ntruss.com/map-place/v1/search?query="
    let defaultURLSecond = "&coordinate="

    let testCoordiate = "126.942517,37.514119"

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.backgroundColor = .white
        view.addSubview(resultTableView)
        resultTableView.register(studyMesseger_V_TV_C.self, forCellReuseIdentifier: "cell")

        self.navigationController?.visibleViewController?.title = "장소 검색"
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "스터디할 장소를 입력하세요!"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        // 이거뭐임?
        definesPresentationContext = true
        
        offlineVM.data
            .drive(resultTableView.rx.items(cellIdentifier: "cell", cellType: resultTableViewCell.self)) { _, receiveJson, cell in
                cell.titleLabel.text = receiveJson.name
                cell.addressLabel.text = receiveJson.jibun_address
            }.disposed(by: disposeBag)
        
        searchController.searchBar.rx.text.orEmpty
            .bind(to: offlineVM.searchText)
            .disposed(by : disposeBag)
        
        
//
//        resultTableView.rx.items(cellIdentifier: "cell"){ _, receiveJson, cell in
//
//            cell
//        }
//
        

        NSLayoutConstraint.activate([
            resultTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            resultTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            resultTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            resultTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            ])
    }
    func searchEvent(_ s :String){
        if !s.isEmpty {
            let addStringEncoding = (defaultURLFirst + s + defaultURLSecond + testCoordiate).addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
            
            var request = URLRequest(url: URL(string: addStringEncoding!)!)
            request.httpMethod = "GET"
            request.addValue(ClientID, forHTTPHeaderField: "X-NCP-APIGW-API-KEY-ID")
            request.addValue(ClientSecret, forHTTPHeaderField: "X-NCP-APIGW-API-KEY")
            
            
            //Session
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            
            //Task
            let task = session.dataTask(with: request) { (data, response, error) in
                //통신 성공
                guard let dataResponse = data,
                    error == nil else {
                        print(error?.localizedDescription ?? "Response Error")
                        return }
                do{
                    //here dataResponse received from a network request
                    let jsonResponse = try JSONSerialization.jsonObject(with:
                        dataResponse, options: [])
//                    print(jsonResponse) //Response result
                    
                    let arr = offlineSearch_VM.parse(json: jsonResponse)
                    print(arr)
                    
                } catch let parsingError {
                    print("Error", parsingError)
                }
            }
            task.resume()

            
        }
    }
    let resultTableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .cyan
        return table
    }()
}
class resultTableViewCell : UITableViewCell {
    override func layoutSubviews() {
        super.layoutSubviews()
        initView()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initView(){
        self.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(addressLabel)
        
    }
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var addressLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var stackView : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel,addressLabel])
        stack.alignment = .fill
        stack.distribution = .fill
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
}
