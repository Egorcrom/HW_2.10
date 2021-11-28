//
//  FactViewController.swift
//  HW_2.10
//
//  Created by Егор Кромин on 28.11.2021.
//

import UIKit

class FactViewController: UIViewController {

    @IBOutlet var factTextView: UITextView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidesWhenStopped = true
        fetchFact()
    }
    
    private func fetchFact() {
        guard let url = URL(string: NetworkManager.Link.factURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let fact = try JSONDecoder().decode(Fact.self, from: data)
                DispatchQueue.main.async {
                    self.factTextView.text = fact.value
                    self.activityIndicator.stopAnimating()
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }

}
