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
    
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidesWhenStopped = true
        networkManager.fetchFact(textView: factTextView,
                                 indicator: activityIndicator)
        self.activityIndicator.stopAnimating()
    }
}
