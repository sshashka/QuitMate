//
//  MainScreenModuleNetworking.swift
//  QuitMate
//
//  Created by Саша Василенко on 17.02.2023.
//

import Foundation
import Combine

enum NetworkErrors: Error {
    
}

protocol MainScreenModuleNetworkingProtocol: AnyObject {
    func getNews(for page: Int, completion: @escaping(MainScreenNews) -> Void)
}

final class MainScreenModuleNetworking: NewsApi {
    func getLinkString(page: Int = 1) -> String {
        return baseURL + "everything?q=smoking" + token + "&pageSize=\(standartPageSize)" + "&page=\(page)"
    }
}

extension MainScreenModuleNetworking: MainScreenModuleNetworkingProtocol {
    func getNews(for page: Int, completion: @escaping(MainScreenNews) -> Void) {
        let url = URL(string: getLinkString(page: page))
        guard let url = url else { return }
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(ApiArrayResponce<MainScreenNewsModuleModel>.self, from: data)
                DispatchQueue.main.async {
                    completion(result.articles)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
