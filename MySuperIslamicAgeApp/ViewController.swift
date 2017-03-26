//
//  ViewController.swift
//  MySuperIslamicAgeApp
//
//  Created by Mohammad Hemani on 3/25/17.
//  Copyright © 2017 Mohammad Hemani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gregorianButton: MaterialButton!
    @IBOutlet weak var islamicButton: MaterialButton!
    @IBOutlet weak var gregorianLabel: UILabel!
    @IBOutlet weak var islamicLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var resultsView: MaterialView!
    @IBOutlet weak var dateAndToolbarView: MaterialView!
    @IBOutlet weak var mainStackView: UIStackView!
    
    var dateType: DateType!
    var gDate: Date!
    var iDate: Date!
    let buttonTextPrefix: String = "Tap to Select"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func dateButtonTapped(_ sender: UIButton) {
        
        if sender.tag == 1 {
            
            datePicker.calendar = Calendar(identifier: .gregorian)
            hideDatePickerAndToolbar(false)
            
            dateType = DateType.Gregorian
            
        } else if sender.tag == 2 {
            
            datePicker.calendar = Calendar(identifier: .islamicUmmAlQura)
            hideDatePickerAndToolbar(false)
            
            dateType = DateType.Islamic
        }
        
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        
        hideDatePickerAndToolbar(true)
        
    }
    
    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
        
        hideDatePickerAndToolbar(true)
        setupFirstView()
        setupSecondView()
        
    }
    
    func hideDatePickerAndToolbar(_ hide: Bool) {
        
        dateAndToolbarView.isHidden = hide
        let alphaValue: CGFloat = hide ? 1.0 : 0.0
        resultsView.alpha = alphaValue
        
        if !hide && mainStackView.axis == .horizontal {
            mainStackView.alpha = alphaValue
        } else {
            mainStackView.alpha = 1.0
        }
        
    }
    
    func setupFirstView() {
        
        let dateFormatter = DateFormatter()
        
        if self.dateType == DateType.Gregorian {
            dateFormatter.calendar = Calendar(identifier: .gregorian)
            gDate = datePicker.date
        } else {
            dateFormatter.calendar = Calendar(identifier: .islamicUmmAlQura)
            iDate = datePicker.date
        }
        
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let title = dateFormatter.string(from: datePicker.date)
        dateFormatter.dateStyle = .short
        let shortDate = dateFormatter.string(from: datePicker.date)
        
        var dateString: String
        
        let dateType:DateType = self.dateType
        switch dateType {
        case DateType.Gregorian:
            gregorianButton.setTitle(title, for: .normal)
            if let date = getIslamicDateFromGregorianDate(shortDate) {
                dateString = date.string
                iDate = date.date
            } else {
                dateString = "\(buttonTextPrefix) \(dateType.rawValue) Date"
            }
            islamicButton.setTitle(dateString, for: .normal)
            
        case DateType.Islamic:
            islamicButton.setTitle(title, for: .normal)
            if let date = getGregorianDateFromIslamicDate(shortDate.replacingOccurrences(of: " AH", with: "")) {
                dateString = date.string
                gDate = date.date
            } else {
                dateString = "\(buttonTextPrefix) \(dateType.rawValue) Date"
            }
            gregorianButton.setTitle(dateString, for: .normal)
        }
        self.dateType = nil
    }
    
    func setupSecondView() {

        updateGregorianLabel()
        updateIslamicLabel()
        
    }
    
    func updateGregorianLabel() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .short
        let shortDate = dateFormatter.string(from: gDate)
            
        gregorianLabel.text = daysPassedFromGregorianDate(shortDate)

    }
    
    func updateIslamicLabel() {
        
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .islamicUmmAlQura)
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .short
        let shortDate = dateFormatter.string(from: iDate)
        
        islamicLabel.text = daysPassedFromIslamicDate(shortDate.replacingOccurrences(of: " AH", with: ""))
        
    }

}
