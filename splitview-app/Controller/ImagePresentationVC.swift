//
//  DetailViewController.swift
//  splitview-app
//
//  Created by James Ullom on 9/26/18.
//  Copyright © 2018 Hammer of the Gods Software. All rights reserved.
//

import UIKit

class ImagePresentationVC: UIViewController {

    @IBOutlet var itemImageView: UIImageView!
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        itemImageView.image = image
    }



}

