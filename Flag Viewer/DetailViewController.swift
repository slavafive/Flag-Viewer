//
//  DetailViewController.swift
//  Flag Viewer
//
//  Created by Вячеслав Ефимов on 03.01.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var country: String?
    var picture: String?

    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        title = country
        imageView.image = UIImage(named: picture!)

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

    }
    
    @objc func shareTapped() {
        let activityController = UIActivityViewController(activityItems: [imageView.image], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
    

}
