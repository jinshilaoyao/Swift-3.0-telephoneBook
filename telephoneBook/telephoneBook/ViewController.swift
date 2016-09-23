//
//  ViewController.swift
//  telephoneBook
//
//  Created by yesway on 16/9/23.
//  Copyright © 2016年 joker. All rights reserved.
//

import UIKit
import AddressBookUI
import ContactsUI

@available(iOS 9.0, *)
class ViewController: UIViewController, CNContactPickerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        telephoneOne()
    }

    func telephoneOne() {
        
        let contactStore = CNContactStore()
        
        let status = CNContactStore.authorizationStatus(for: .contacts)
        
        if status != .authorized  {
            
            contactStore.requestAccess(for: .contacts, completionHandler: { (success, error) in
                
            })
            
            return
        }
        
        let ctl = CNContactPickerViewController()
        ctl.delegate = self
        present(ctl, animated: true, completion: nil)
    }
    
    
    /*!
     * @abstract Invoked when the picker is closed.
     * @discussion The picker will be dismissed automatically after a contact or property is picked.
     */
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        
    }
    
    
    /*!
     * @abstract Singular delegate methods.
     * @discussion These delegate methods will be invoked when the user selects a single contact or property.
     */
//    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
//        
//        print("\(contact.familyName) ---- \(contact.givenName)")
//        
//        for labelValue in contact.phoneNumbers {
//            
//            let phoneNumber = labelValue.value
//            
//            print(phoneNumber.stringValue)
//            
//        }
//        
//        
//    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contactProperty: CNContactProperty) {
        print(contactProperty.value)
    }
    
    
    /*!
     * @abstract Plural delegate methods.
     * @discussion These delegate methods will be invoked when the user is done selecting multiple contacts or properties.
     * Implementing one of these methods will configure the picker for multi-selection.
     */
    

}

