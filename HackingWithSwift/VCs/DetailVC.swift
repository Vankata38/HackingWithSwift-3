//
//  DetailVC.swift
//  HackingWithSwift
//
//  Created by Ivan Terziev on 15.06.20.
//  Copyright © 2020 Ivan Terziev. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    // MARK: - Properties
    @IBOutlet var imageView: UIImageView!
    var imageName: String?
    var imageNumber: Int?
    var arrayCount: Int?
    
    
    // MARK: - App lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the title
        navigationItem.largeTitleDisplayMode = .never
        guard imageNumber != 0 && arrayCount != 0 else {
            return
        }
        title = ("Picture \(imageNumber!) of \(arrayCount!)")
        
        // Create a navigation button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = imageName {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    // View controller is about to appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    // View controller disappears
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    
    // MARK: - Methods
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 1) else {
            print("No image found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
