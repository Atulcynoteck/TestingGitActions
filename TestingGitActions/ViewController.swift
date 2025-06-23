//
//  ViewController.swift
//  TestingGitActions
//
//  Created by Atul Tiwari on 23/06/25.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var pressButton: UIButton!
    @IBOutlet var txtLbl: UILabel!
    @IBOutlet var txtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pressButton.isEnabled = false
        txtField.delegate = self // Set the delegate
        updateButtonAppearance()
        printHelloWorld()
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        guard let text = txtField.text, !text.isEmpty else {
            pressButton.isEnabled = false
            updateButtonAppearance()
            return
        }
        pressButton.isEnabled = true
        txtLbl.text = text
        updateButtonAppearance()
    }
    
    func printHelloWorld() {
        print("Hello, World!")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Calculate the new text length
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        // Update button state based on new text
        pressButton.isEnabled = !updatedText.isEmpty
        updateButtonAppearance()
        
        return true
    }
    
    private func updateButtonAppearance() {
        pressButton.alpha = pressButton.isEnabled ? 1.0 : 0.5
    }
}
