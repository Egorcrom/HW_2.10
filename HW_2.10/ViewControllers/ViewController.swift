//
//  ViewController.swift
//  HW_2.10
//
//  Created by Егор Кромин on 28.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidesWhenStopped = true
        networkManager.fetchImage(imageView: imageView,
                                  indicator: activityIndicator)
    }
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
}

