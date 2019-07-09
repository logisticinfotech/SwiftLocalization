//
//  CountryListViewController.swift
//  LocalizationDemo
//
//  Created by Krishna on 20/06/19.
//  Copyright © 2019 Krishna. All rights reserved.
//

import UIKit

class CountryListViewController: UIViewController {

    //# MARK: - IBOutlet Variables
    //# MARK: -
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tblCountry: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    
    //# MARK: - Class Variables
    //# MARK: -
    
    var arrCountry = [String]()

    //# MARK: - View Controller Life Cycle Method
    //# MARK: -
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        arrCountry = [AppHelper.getLocalizeString(str: "India"),                AppHelper.getLocalizeString(str: "Australia"),
            AppHelper.getLocalizeString(str: "Mexico"),
            AppHelper.getLocalizeString(str: "Kenya"),
            AppHelper.getLocalizeString(str: "China"),
            AppHelper.getLocalizeString(str: "Bhutan"),
            AppHelper.getLocalizeString(str: "Canada"),
            AppHelper.getLocalizeString(str: "Japan"),
            AppHelper.getLocalizeString(str: "Qatar"),
            AppHelper.getLocalizeString(str: "Israel")]
        
        lblTitle.text = AppHelper.getLocalizeString(str: "Country List")
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

extension CountryListViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrCountry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let lblCountryName = cell.viewWithTag(101) as! UILabel
        lblCountryName.text = arrCountry[indexPath.row]
        
        let imgSelect = cell.viewWithTag(102) as! UIImageView
        if UserDefaults.standard.object(forKey: "Language") as! String == "he"
        {
            imgSelect.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let objDetailStoryboard = UIStoryboard.init(name: "CountryDetailSB", bundle: nil)
        let objDetailVC = objDetailStoryboard.instantiateViewController(withIdentifier: "CountryDetailViewController") as! CountryDetailViewController
        objDetailVC.countryName = arrCountry[indexPath.row]
        self.navigationController?.pushViewController(objDetailVC, animated: true)
    }
}
