//
//  RequestManager.swift
//  Sagar_Engineet.AI_Test
//
//  Created by pcq196 on 17/12/19.
//  Copyright © 2019 pcq196. All rights reserved.
//

import Foundation
import Alamofire

struct Request {
    var url:String?
    var method:HTTPMethod?
    var parameters:[String:Any]
    var header:HTTPHeaders?
}
final class RequestManger {
    //MARK: - Variables
    static let share:RequestManger = RequestManger()
    
    //MARK: - Methods
    func requestwithget(url:String,complition:@escaping(_ success:Bool,_ resultdata:Data,_ message:String) -> Void){
        let req = self.createrequest(url: url, method: HTTPMethod.get);
        self.sendrequest(request: req) { (success, result, message) in
            complition(success,result,message)
        }
    }
    private func sendrequest(request:Request,complition:@escaping(_ success:Bool,_ resultdata:Data,_ message:String) -> Void){
        Alamofire.request(request.url!, method: request.method!, parameters: request.parameters, encoding: URLEncoding.default, headers: request.header!).responseData { (response) in
            switch response.result{
                case .failure:
                    if let message = response.error{
                        complition(false,Data(),message.localizedDescription)
                    }else{
                        complition(false,Data(),"request not call.");
                    }
                    break;
                case .success:
                    if let resultdt = response.result.value{
                        complition(true,resultdt,"success")
                    }else{
                        complition(false,Data(),"No data found.");
                    }
                    break;
            }
        }
    }
    private func createrequest(url:String,method:HTTPMethod,exteheader:[String:String] = [:],parameters:[String:Any] = [:]) -> Request{
        let newrequest = Request(url: url, method: method, parameters: parameters, header: exteheader)
        return newrequest;
    }
}
