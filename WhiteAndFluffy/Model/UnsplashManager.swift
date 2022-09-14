//
//  UnsplashManager.swift
//  WhiteAndFluffy
//
//  Created by Асхат Баймуканов on 07.09.2022.
//

import Foundation

class UnsplashManager {
    
    let unsplashApiKey = UnsplashApiKey()
    
    var baseURL = "https://api.unsplash.com/"
    
    
    func createURL (with queryValue: String) {
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        
        let queryItemCliendID = URLQueryItem(name: "client_id", value: unsplashApiKey.accessKey)
        let queryItemQuery = URLQueryItem(name: "query", value: queryValue)
        
        components.queryItems = [queryItemCliendID, queryItemQuery]
        if let url = components.url {
            performRequest(with: url)
        }
        
    }
    
    func performRequest (with url: URL) {
        //let url = "https://api.unsplash.com/search/photos?\(unsplashApiKey.accessKey)&\(query)"
        let session = URLSession.shared
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            if error != nil {
                print("error")
                return
            }
            if let safeData = data {
                print(String(decoding: safeData, as: UTF8.self))
                if let unsplash = self!.parseJSON(with: safeData){
                    print(unsplash)
                }
            }
            
        }
        task.resume()
    }
    
    func parseJSON(with unsplashData: Data) -> UnsplashModel? {
        
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(UnsplashData.self, from: unsplashData)
            let id = decodedData.results.id
            let total = decodedData.total
            let description = decodedData.results.description
            let imageURL = decodedData.results.urls.small
            
            let unsplash = UnsplashModel(photoID: id, photoDescription: description, imageURL: imageURL, total: total)
            return unsplash
        } catch {
            print(error)
            return nil
        }
    }
    
}
