//
//  ServerConnectionManager.swift
//  bridflix
//
//  Created by Gabriel on 16/03/17.
//  Copyright © 2017 bridge. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper


public class ServerConnectionManager{
    
    static let baseUrl:String = "http://localhost:8080/"
    
    static var currentToken:String?
        
    static func registerUser(login:LoginDTO, failFun:@escaping ()->(),successFun:@escaping ()->()){
        let localUrl:String = baseUrl+"register"
        
        let body:Parameters = [
                                "userName":login.userName,
                                "password":login.password
                              ]
        
        var user : User?
        
        Alamofire.request(localUrl, method: .post, parameters:body,encoding : JSONEncoding.default).responseJSON{ (response) -> Void in
            guard response.result.isSuccess else{
                print("fail register request")
                failFun()
                return
            }

            print(response.result.value ?? "No response")
            let json:NSDictionary = response.result.value as! NSDictionary
            user = Mapper<User>().map(JSONObject : json)!
            currentToken = user?.token!
            successFun()
        }
    }
    
    static func getMovies(failFun:@escaping ()->(),successFun:@escaping (_ movies:[MovieItem])->()){
        let localUrl:String = baseUrl+"movies?token="+currentToken!
        
        print("Get Movies")
        
        let body:Parameters = [
            "token":currentToken!,
        ]
        
        Alamofire.request(localUrl, method: .get, parameters:body,encoding : JSONEncoding.default).responseJSON{ (response) -> Void in
            guard response.result.isSuccess else{
                print("fail register request")
                failFun()
                return
            }
            
            print(response.result.value ?? "No response")
            let json:[NSDictionary] = response.result.value as! [NSDictionary]
            let movies: [MovieItem] = Mapper<MovieItem>().mapArray(JSONArray: json as! [[String : Any]])!
            successFun(movies)
        }
    }
}

