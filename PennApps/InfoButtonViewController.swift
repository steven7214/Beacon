//
//  InfoButtonViewController.swift
//  PennApps
//
//  Created by Helen Dong on 9/7/19.
//  Copyright © 2019 Helen Dong. All rights reserved.
//

import UIKit

class InfoButtonViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate{
    
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
        
        nameBar.delegate = self
        nameBar.returnKeyType = .done
        nameBar.text = information[0]
        
        phoneBar.text = information[1]
        
        disasterBar.delegate = self
        disasterBar.returnKeyType = .done
        disasterBar.text = information[2]
        
        commentsBar.delegate = self
      //  commentsBar.returnKeyType = .done
        commentsBar.text = information[3]
        // Do any additional setup after loading the view.
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
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
