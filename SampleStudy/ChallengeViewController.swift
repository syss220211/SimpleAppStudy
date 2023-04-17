//
//  ChallengeViewController.swift
//  SimpleAppStudy
//
//  Created by 박서연 on 2023/04/16.
//

import UIKit

class ChallengeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func DCodeButton(_ sender: UIButton) {
//        guard let identifierViewController = self.storyboard?.instantiateViewController(identifier: "DView") else { return }
//        self.navigationController?.pushViewController(identifierViewController, animated: true)
        if let identifierViewController = self.storyboard?.instantiateViewController(identifier: "DView") as? DCodeViewController {
            self.navigationController?.pushViewController(identifierViewController, animated: true)
        }
    }
    
    @IBAction func ECodeButton(_ sender: UIButton) {
//        guard let identifierViewController = self.storyboard?.instantiateViewController(withIdentifier: "EView") else { return }
//        self.present(identifierViewController, animated: true)
        
        if let identifierViewController = self.storyboard?.instantiateViewController(withIdentifier: "EView") as? ECodeViewController {
            self.present(identifierViewController, animated: true)
        }
        
    }
    
    @IBAction func TestPerform(_ sender: UIButton) {
        performSegue(withIdentifier: "TestPerform", sender: sender)
    }

}
