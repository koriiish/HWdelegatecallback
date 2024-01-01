//
//  SecondViewController.swift
//  HWdelegatecallback
//
//  Created by Карина Дьячина on 1.01.24.
//

import UIKit

protocol StringDelegate: AnyObject {
    func recieveString(text: String)
}

class SecondViewController: UIViewController {
  //  var labelForAllText: UILabel!
    var recieveText: String = ""
    weak var delegate: StringDelegate?
    @IBOutlet weak var firstTextField: UITextField!
    
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var saveTextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    
    }

    @IBAction func saveTextFieldButton(_ sender: Any) {
        recieveText = "\(firstTextField.text ?? "first text field is empty") + \(secondTextField.text ?? "second text field is empty") + \(thirdTextField.text ?? "third text field is empty")"
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vC: UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vC, animated: true)
//        if let navigationController = navigationController {
//            navigationController.pushViewController(vC, animated: true)
//        } else {
//            let navController = UINavigationController(rootViewController: vC)
//            navController.navigationBar.prefersLargeTitles = true
//            present(navController, animated: true, completion: nil)
//        }
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func sendString() { // вне вью дид лоуда
       // let message = recieveText
        delegate?.recieveString(text: recieveText)
    }



    
}
