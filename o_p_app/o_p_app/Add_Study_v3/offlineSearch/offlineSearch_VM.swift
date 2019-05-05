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

    let searchText = BehaviorRelay(value: "")
    
    lazy var data : Driver<[receiveJson]> = {
        
        return self.searchText.asObservable()
        
            .throttle(0.3, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .flatMapLatest(offlineSearch_VM.searchEvent)
            .asDriver(onErrorJustReturn: [])
    }()


    
    static func searchEvent(_ s :String) -> Observable<[receiveJson]>{
        let ClientID = "kf5waz8f2e"
        let ClientSecret = "P2uO4r61I4ViAo4EviCwaTdUr1WHgHBlkgysKFRP"
        let defaultURLFirst = "https://naveropenapi.apigw.ntruss.com/map-place/v1/search?query="
        let defaultURLSecond = "&coordinate="
        
        let testCoordiate = "126.942517,37.514119"

        if !s.isEmpty {
            let addStringEncoding = (defaultURLFirst + s + defaultURLSecond + testCoordiate).addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
            
            var request = URLRequest(url: URL(string: addStringEncoding!)!)
            request.httpMethod = "GET"
            request.addValue(ClientID, forHTTPHeaderField: "X-NCP-APIGW-API-KEY-ID")
            request.addValue(ClientSecret, forHTTPHeaderField: "X-NCP-APIGW-API-KEY")
            
            
            return URLSession.shared.rx.response(request: request)
                .retry(3)
                .map(parse)
//            //Session
//            let config = URLSessionConfiguration.default
//            let session = URLSession(configuration: config)
//
//            //Task
//            let task = session.dataTask(with: request) { (data, response, error) in
//                //통신 성공
//                guard let dataResponse = data,
//                    error == nil else {
//                        print(error?.localizedDescription ?? "Response Error")
//                        return }
//                do{
//                    //here dataResponse received from a network request
//                    let jsonResponse = try JSONSerialization.jsonObject(with:
//                        dataResponse, options: [])
//                    //                    print(jsonResponse) //Response result
//
//
//                } catch let parsingError {
//                    print("Error", parsingError)
//                }
//            }
//            task.resume()
//
            
        }
        return Observable.just([])
    }

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
