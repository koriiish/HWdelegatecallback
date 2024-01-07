//
//  SecondViewController.swift
//  HWdelegatecallback
//
//  Created by Карина Дьячина on 1.01.24.
//

import UIKit

protocol SendMessageDelegate: AnyObject {
    func recieveString(text: String)
}


class SecondViewController: UIViewController, SendMessageDelegate {
    func recieveString(text: String) {
    }
    
    //  var labelForAllText: UILabel!
    //   var message: String = ""
    var recieveText: String = ""
    weak var delegate: SendMessageDelegate?
    @IBOutlet weak var firstTextField: UITextField!
    
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var saveTextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func saveTextFieldButton(_ sender: Any) {
        
        print(firstTextField.text)
        print(secondTextField.text)
        print(thirdTextField.text)
        recieveText = "\(firstTextField.text ?? "first text field is empty") + \(secondTextField.text ?? "second text field is empty") + \(thirdTextField.text ?? "third text field is empty")"
        delegate?.recieveString(text: recieveText)
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
    
    func sendString() {
        let message = recieveText
        delegate?.recieveString(text: recieveText)
    }
    
}
                    
