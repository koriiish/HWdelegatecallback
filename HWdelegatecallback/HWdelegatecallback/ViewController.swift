//
//  ViewController.swift
//  HWdelegatecallback
//
//  Created by Карина Дьячина on 1.01.24.
//

import UIKit


class ViewController: UIViewController {
   
    @IBOutlet weak var nextScreenButton: UIButton!
 //   weak var delegate: StringDelegate?
    @IBOutlet weak var labelForAllText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func nextButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Second", bundle: nil)
        let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.delegate = self
        if let navigationController = navigationController {
            navigationController.pushViewController(secondVC, animated: true)
        } else {
            let navController = UINavigationController(rootViewController: secondVC)
            navController.navigationBar.prefersLargeTitles = true
            present(navController, animated: true, completion: nil)
        }
    }

}

extension ViewController: SendMessageDelegate {

    func recieveString(text: String) {
        self.labelForAllText.text = text
        print("Get message: \(text)")
    }
    
}



//подключи к классу UITextFieldDelegate
//после воспользуйся функцией
//func textFieldDidEndEditing(_ textField: UITextField) {
//texfiled.text = label.text
//}
//Создать два экрана.
//На первом экране UILabel и кнопка
//По нажатию на кнопку, происходит переход на второй экран.
//На втором экране 3 текстовых поля и кнопка сохранить.
//По нажатию на кнопку, введенные данные передаются на первый экран в UILabel, и второй экран закрывается.
//Сделать черезе делегат
