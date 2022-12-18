//
//  DetailViewController.swift
//  NavigationView
//
//  Created by Tianbo Qiu on 12/18/22.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var nameField: UITextField!
    @IBOutlet var uidField: UITextField!
    @IBOutlet var valueField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }
    
    let numberFormatter: NumberFormatter = {
       let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameField.text = item.name
        uidField.text = item.uid
        valueField.text = numberFormatter.string(from: NSNumber(value: item.value))
        dateLabel.text = dateFormatter.string(from: item.createdAt)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // dismiss keyboard
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func backgroundTapped() {
        view.endEditing(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
        if let name = nameField.text {
            item.name = name
        }
        if let uid = uidField.text {
            item.uid = uid
        }
        if let valueText = valueField.text, let value = numberFormatter.number(from: valueText) {
            item.value = value.intValue
        }
    }
}
