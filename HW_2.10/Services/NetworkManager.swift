//
//  NetworkManager.swift
//  HW_2.10
//
//  Created by Егор Кромин on 28.11.2021.
//

import Foundation
import UIKit

class NetworkManager {
    
    enum Link: String {
        case imageURL = "https://m.media-amazon.com/images/I/51btEGxXDEL.jpg"
        case factURL = "https://api.chucknorris.io/jokes/random"
    }
    
    func fetchImage(imageView: UIImageView, indicator: UIActivityIndicatorView) {
        guard let url = URL(string: Link.imageURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            print(response)
            guard let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                imageView.image = image
                indicator.stopAnimating()
            }
        }.resume()
}
    func fetchFact(textView: UITextView, indicator: UIActivityIndicatorView) {
        guard let url = URL(string: Link.factURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let fact = try JSONDecoder().decode(Fact.self, from: data)
                DispatchQueue.main.async {
                    textView.text = fact.value
                    indicator.stopAnimating()
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
