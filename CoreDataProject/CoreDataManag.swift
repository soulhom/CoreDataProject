//
//  CoreDataManag.swift
//  CoreDataProject
//
//  Created by GetHired on 9/27/18.
//  Copyright © 2018 GetHired. All rights reserved.
//

import CoreData

struct CoreDataManager{
    
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TrainingModel")
        container.loadPersistentStores { (storeDescription, err) in
            if let err = err{
                fatalError("Loading of store failed: \(err)")
            }
        }
        
        return container
    }()
    
    func fetchCompanies() -> [Company] {
        
        let context = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Company>(entityName: "Company")
        
        do{
            let companies = try context.fetch(fetchRequest)
            return companies
        } catch let fetchErr{
            print("Failed to fetch compnies:", fetchErr)
            return []
        }
    }
    
    func createEmployee(name: String, birthday: Date, employeeType: String, company: Company) -> (Employee?, Error?) {
        let context = persistentContainer.viewContext
        
        let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context) as! Employee
        employee.setValue(name, forKey: "name")
        
        employee.company = company 
        employee.type = employeeType
        
        let employeeInformation = NSEntityDescription.insertNewObject(forEntityName: "EmployeeInformation", into: context) as! EmployeeInformation
        
        employeeInformation.birthday = birthday
        
        employee.employeeInfomation = employeeInformation
        
        do {
            try context.save()
            return (employee, nil)
        } catch let err {
            print("Failed to create employee:", err)
            return (nil, err)
        }
    }
    
}
