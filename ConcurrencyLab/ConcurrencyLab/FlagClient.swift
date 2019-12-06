//
//  FlagClient.swift
//  ConcurrencyLab
//
//  Created by Tsering Lama on 12/6/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import UIKit

struct FlagClient {
    static func getImage(countryUrl: String, completionHandler: @escaping (Result<UIImage?,Error>) -> ()) {
        guard let url = URL(string: countryUrl) else {
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("\(error)")
            }
            if let data = data {
                let image = UIImage(data: data)
                completionHandler(.success(image))
            }
        }
        dataTask.resume()
}
}
