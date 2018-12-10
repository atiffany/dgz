//
//  ViewController.swift
//  doggos
//
//  Created by Tiffany, Abby on 8/8/18.
//  Copyright © 2018 Tiffany, Abby. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController {

    @IBOutlet weak var landingImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let landingImageURL = NSLocalizedString("landingImageURL", comment: "testing")
        let url = URL(string: landingImageURL)
        let data = try? Data(contentsOf: url!)
        
        if let imageData = data {
            landingImage.image = UIImage(data: imageData)
            let screenSize: CGRect = CGRect(x: 0, y: 0, width: 50, height: UIScreen.main.bounds.height * 0.2)
            landingImage.alignmentRect(forFrame: screenSize)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

