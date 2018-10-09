//
//  CompanyController+CreateCompany.swift
//  CoreDataProject
//
//  Created by GetHired on 9/28/18.
//  Copyright © 2018 GetHired. All rights reserved.
//

import UIKit

extension CompaniesController:  CreateCompanyControllerDelegate{
    func didEditCompany(company: Company) {
        let row = companies.index(of: company)
        let reloadIndex = IndexPath(row: row!, section: 0)
        
        tableView.reloadRows(at: [reloadIndex], with: .middle)
    }
    
    func didAddCompany(company: Company) {
        companies.append(company)   // 1 - modify companies list
        
        let newIndexPath = IndexPath(row: companies.count-1, section: 0) // 2 - insert table view
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
}
