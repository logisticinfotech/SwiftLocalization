//
//  CountryDetailViewController.swift
//  LocalizationDemo
//
//  Created by Krishna on 20/06/19.
//  Copyright © 2019 Krishna. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {
  
    //# MARK: - IBOutlet Variables
    //# MARK: -
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnBack: UIButton!

    //# MARK: - Class Variables
    //# MARK: -
    
    var countryName: String = ""
    
    //# MARK: - View Controller Life Cycle Method
    //# MARK: -
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        lblTitle.text = AppHelper.getLocalizeString(str: countryName)
        lblDescription.text = AppHelper.getLocalizeString(str: "Country Description Here...")
        
        if UserDefaults.standard.object(forKey: "Language") as! String == "he"
        {
            self.btnBack.imageView!.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
    }
    
    //# MARK: - Button Click Method
    //# MARK: -
    
    @IBAction func onClickBack(_ sender: Any)
    {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
