//
//  Companies+UITableView.swift
//  CoreDataProject
//
//  Created by GetHired on 9/28/18.
//  Copyright © 2018 GetHired. All rights reserved.
//

import UIKit

extension CompaniesController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let company = self.companies[indexPath.row]
        let employeesController = EmployeesController()
        employeesController.company = company
        
        navigationController?.pushViewController(employeesController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete", handler: deleteHandleFunction)
        deleteAction.backgroundColor = UIColor.lightRed
        
        let editAction = UITableViewRowAction(style: .normal, title: "Edit", handler: editHandleFunction)
        editAction.backgroundColor = UIColor.darkBlue
        
        return [deleteAction, editAction]
    }
    
    private func deleteHandleFunction(action: UITableViewRowAction, indexPath: IndexPath){
        let company = self.companies[indexPath.row]
        
        self.companies.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        context.delete(company)
        do {
            try context.save()
        } catch let saveErr{
            print("Failed to delete company:", saveErr)
        }
    }
    
    private func editHandleFunction(action: UITableViewRowAction, indexPath: IndexPath){
        let editCompanyController = CreateCompanyController()
        editCompanyController.delegate = self
        editCompanyController.company = companies[indexPath.row]
        
        let navController = CustomNavigatinController(rootViewController: editCompanyController)
        present(navController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "No companies available..."
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return companies.count == 0 ? 150 : 0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.lightBlue
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CompanyCell
        
        let compnay = companies[indexPath.row]
        cell.company = compnay
        
        return cell
    }
}
