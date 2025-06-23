//
//  ViewContollerClassTestCase.swift
//  TestingGitActionsTests
//
//  Created by Atul Tiwari on 23/06/25.
//

import XCTest
@testable import TestingGitActions
class ViewControllerTests: XCTestCase {
    
    var viewController: ViewController!
    
    override func setUp() {
        super.setUp()
        // Initialize view controller from storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your storyboard name
        viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        
        // Load the view hierarchy
        viewController.loadViewIfNeeded()
    }
    
    override func tearDown() {
        viewController = nil
        super.tearDown()
    }
    
    func testButtonDisabledAndAlphaWhenTextFieldIsEmpty() {
        // Set text field to empty
        viewController.txtField.text = ""
        
        // Simulate text field change
        let _ = viewController.textField(viewController.txtField, shouldChangeCharactersIn: NSRange(location: 0, length: 0), replacementString: "")
        
        // Verify button is disabled and alpha is 0.5
        XCTAssertFalse(viewController.pressButton.isEnabled, "Button should be disabled when text field is empty")
        XCTAssertEqual(viewController.pressButton.alpha, 0.5, accuracy: 0.01, "Button alpha should be 0.5 when disabled")
    }
    
    func testButtonEnabledAndAlphaWhenTextFieldHasText() {
        // Set text field with some text
        viewController.txtField.text = "Test Text"
        
        // Simulate text field change
        let _ = viewController.textField(viewController.txtField, shouldChangeCharactersIn: NSRange(location: 0, length: 0), replacementString: "Test Text")
        
        // Verify button is enabled and alpha is 1.0
        XCTAssertTrue(viewController.pressButton.isEnabled, "Button should be enabled when text field has text")
        XCTAssertEqual(viewController.pressButton.alpha, 1.0, accuracy: 0.01, "Button alpha should be 1.0 when enabled")
    }
    
    func testButtonTappedWithEmptyText() {
        // Set text field to empty
        viewController.txtField.text = ""
        
        // Simulate button tap
        viewController.buttonTapped(viewController)
        
        // Verify button is disabled and alpha is 0.5
        XCTAssertFalse(viewController.pressButton.isEnabled, "Button should be disabled after tapping with empty text")
        XCTAssertEqual(viewController.pressButton.alpha, 0.5, accuracy: 0.01, "Button alpha should be 0.5 when disabled")
    }
    
    func testButtonTappedWithText() {
        // Set text field with some text
        viewController.txtField.text = "Test Text"
        
        // Simulate button tap
        viewController.buttonTapped(viewController)
        
        // Verify button is enabled and alpha is 1.0, and label is updated
        XCTAssertTrue(viewController.pressButton.isEnabled, "Button should be enabled after tapping with text")
        XCTAssertEqual(viewController.pressButton.alpha, 1.0, accuracy: 0.01, "Button alpha should be 1.0 when enabled")
        XCTAssertEqual(viewController.txtLbl.text, "Test Text", "Label should display the text field content")
    }
}
