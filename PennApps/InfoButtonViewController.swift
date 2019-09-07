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
    @IBOutlet weak var commentsBar: UITextView!
    
    var user: UserInformation!
    

    
    @IBAction func dismissInfo(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let information = user.getInformation()
        nameBar.text = information[0]
        phoneBar.text = information[1]
        disasterBar.text = information[2]
        commentsBar.text = information[3]
        // Do any additional setup after loading the view.
    }
 
    @IBAction func storeValues(_ sender: Any) {
        let information = [nameBar.text, phoneBar.text, disasterBar.text, commentsBar.text] as! [String]
        user.setInformation(information: information)
        dismissInfo((Any).self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is FirstViewController {
            
            let dest = segue.destination as? FirstViewController
            dest?.user = user
        }
    }
}
