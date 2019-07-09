//
//  ViewController.swift
//  LocalizationDemo
//
//  Created by Krishna on 19/06/19.
//  Copyright © 2019 Krishna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //# MARK: - IBOutlet Variables
    //# MARK: -
    
    @IBOutlet weak var tblLanguage: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnNext: UIButton!

    
    //# MARK: - Class Variables
    //# MARK: -
    
    var dictLanguage = [String:String]()
    var selectedLanguage: String = ""

    //# MARK: - View Controller Life Cycle Method
    //# MARK: -
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        dictLanguage = ["en" : "English", "he":"עברית"]
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.tblLanguage.reloadData()
        selectedLanguage = dictLanguage[UserDefaults.standard.object(forKey: "Language") as! String]!
        lblTitle.text = AppHelper.getLocalizeString(str: "Choose Language")
        btnNext.setTitle(AppHelper.getLocalizeString(str: "Next"), for: .normal)        
    }
    
    //# MARK: - Button Click Method
    //# MARK: -
    
    @IBAction func onClickBtnNext(_ sender: Any)
    {
        if selectedLanguage != dictLanguage[UserDefaults.standard.object(forKey: "Language") as! String]
        {
            if selectedLanguage == "English"
            {
                UserDefaults.standard.set("en", forKey: "Language")
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
            }
            else
            {
                UserDefaults.standard.set("he", forKey: "Language")
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
            }
            
            let objStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
            let rootNav = objStoryboard.instantiateViewController(withIdentifier: "rootNav") as! UINavigationController
            UIApplication.shared.keyWindow?.rootViewController = rootNav
            UIApplication.shared.keyWindow?.makeKeyAndVisible()
            
            let objListStoryboard = UIStoryboard.init(name: "CountryListSB", bundle: nil)
            let objListVC = objListStoryboard.instantiateViewController(withIdentifier: "CountryListViewController") as! CountryListViewController
            rootNav.pushViewController(objListVC, animated: true)
        }
        else
        {
            let objListStoryboard = UIStoryboard.init(name: "CountryListSB", bundle: nil)
            let objListVC = objListStoryboard.instantiateViewController(withIdentifier: "CountryListViewController") as! CountryListViewController
            self.navigationController!.pushViewController(objListVC, animated: true)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dictLanguage.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let lblLanName = cell.viewWithTag(101) as! UILabel
        lblLanName.text = Array(dictLanguage)[indexPath.row].value
        
        let imgSelect = cell.viewWithTag(102) as! UIImageView
        if Array(dictLanguage)[indexPath.row].value == selectedLanguage
        {
            imgSelect.isHidden = false
        }
        else
        {
            imgSelect.isHidden = true
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tblLanguage.deselectRow(at: indexPath, animated: false)
        let cell = tblLanguage.cellForRow(at: indexPath)
        selectedLanguage = (cell?.viewWithTag(101) as! UILabel).text!
        tblLanguage.reloadData()
    }
}
