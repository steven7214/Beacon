//
//  InfoButtonViewController.swift
//  PennApps
//
//  Created by Helen Dong on 9/7/19.
//  Copyright © 2019 Helen Dong. All rights reserved.
//

import UIKit

class InfoButtonViewController: UIViewController {
    
    @IBOutlet weak var nameBar: UITextField!
    @IBOutlet weak var phoneBar: UITextField!
    @IBOutlet weak var disasterBar: UITextField!
    
    @IBAction func dismissInfo(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
    @IBAction func storeValues(_ sender: Any) {
        
    }
}
