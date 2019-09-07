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
    
    var user: UserInformation
    
    init(user: UserInformation) {
        self.user = user
        let information = user.getInformation()
        nameBar.text = information[0]
        phoneBar.text = information[1]
        disasterBar.text = information[2]
        commentsBar.text = information[3]
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    @IBAction func dismissInfo(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
    @IBAction func storeValues(_ sender: Any) {
        let information = [nameBar.text, phoneBar.text, disasterBar.text, commentsBar.text] as! [String]
        user.setInformation(information: information)
        dismissInfo((Any).self)
        
    }
}
