//
//  DataManager.swift
//  Tonight
//
//  Created by Роман Путинцев on 26.10.2021.
//

import Foundation
import Alamofire


protocol ApiObject : Decodable {
    static var apiPath: String? { get }
}



struct Api {
    static let baseUrl = "https://api.themoviedb.org/3/"
    static let baseDataUrl = "https://image.tmdb.org/t/p/w500/"
    
    static let baseParameters = ["api_key" : "3c4f8fed562b01d53571dfb7569a5275",
                                 "language" : "ru-RU"]
    
    enum Additions: String {
        case topRated = "top_rated"
    }
    
}


final class NetworkManager {
    
    func get<T: ApiObject>(_ ofType: T.Type,
                               byId id: Int,
                               completion: @escaping (T) -> Void) {
        
        AF.request(Api.baseUrl + T.apiPath! + String(id), parameters: Api.baseParameters).responseDecodable(of: ofType) { response in guard let resultInstance = response.value else { return }
            completion(resultInstance)
        }
        
    }
    
    func get<T: ApiObject>(_ Type: T.Type,
                           with additions: Api.Additions,
                               completion: @escaping (T) -> Void) {
        
        AF.request(Api.baseUrl + T.apiPath! + additions.rawValue, parameters: Api.baseParameters).responseDecodable(of: Type) { response in guard let resultInstance = response.value else { return }
            completion(resultInstance)
        }
        
    }
    
    func getData(from path: String,
                 onQueue queue: DispatchQueue = DispatchQueue.global(qos: .background),
                 _ completion: @escaping (Data?) -> Void ) {
        queue.async {
            let result = try? Data(contentsOf: URL(string: Api.baseDataUrl + path)!)
            completion(result)
        }
        
    }
    
    
}



