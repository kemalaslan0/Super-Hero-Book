//
//  DetailsViewController.swift
//  SuperKahramanKitabi
//
//  Created by Kemal Aslan on 21.08.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textLabel: UILabel!
    var secilenKahramanIsmi = ""
    var secilenKahramanGorselIsmi = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: secilenKahramanGorselIsmi)
        textLabel.text = secilenKahramanIsmi
    
    }
    


}
