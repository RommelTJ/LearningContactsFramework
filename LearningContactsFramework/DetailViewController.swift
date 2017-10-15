//
//  DetailViewController.swift
//  LearningContactsFramework
//
//  Created by Rommel Rico on 10/14/17.
//  Copyright © 2017 Rommel Rico. All rights reserved.
//

import UIKit
import Contacts

class DetailViewController: UIViewController {

    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactPhoneNumberLabel: UILabel!
    
    var contact: CNContact? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the contact item.
        if let contact = self.contact {
            if let label = self.contactNameLabel {
                label.text = CNContactFormatter.string(from: contact, style: .fullName)
            }
            
            if let imageView = self.contactImageView {
                if contact.imageData != nil {
                    imageView.image = UIImage(data: contact.imageData!)
                }
                else {
                    imageView.image = nil
                }
            }
            
            if let phoneNumberLabel = self.contactPhoneNumberLabel {
                var numberArray = [String]()
                for number in contact.phoneNumbers {
                    let phoneNumber = number.value
                    numberArray.append(phoneNumber.stringValue)
                }
                phoneNumberLabel.text = numberArray.joined(separator: ", ")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

}
