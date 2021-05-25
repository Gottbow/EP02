//
//  ViewController.swift
//  EP02
//
//  Created by user191022 on 5/21/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cnsVerticalContent:
        NSLayoutConstraint!
    
    @IBAction func clickBtnLogin(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardNotifiacion()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.unregisterKeyboardNotification()
    }

}




extension ViewController {
    
    func registerKeyboardNotifiacion(  ) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    func unregisterKeyboardNotification( ) {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        
        _ = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        _ = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        
        
    }
    
    @objc func keyboardWillHide(_  notification: Notification){
        
        let keyboardAnimationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: keyboardAnimationDuration){
            self.cnsVerticalContent.constant = 0
            self.view.layoutIfNeeded()
        }
        
    }
}
