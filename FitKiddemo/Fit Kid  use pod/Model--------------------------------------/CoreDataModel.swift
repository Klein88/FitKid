//
//  CoreDataModel.swift
//  Fit Kid  use pod
//
//  Created by 邱文豪 on 2023/6/17.
//

import Foundation
import CoreData

class CaloriesModel : ObservableObject
{
    var container : NSPersistentContainer
    @Published var Datas : [Calories] = []
    init()
    {
        container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: {
            (discriped , err) in
            if let err = err{
                print("hss some err for the coredata:" , err.localizedDescription)
            }
        })
        fetchData()
    }
    
    func addData(time : Date , calorie : Int , sportname : String)
    {
        let newData = Calories(context: container.viewContext)
        newData.calorie = Int64(calorie)
        newData.time = time
        newData.sportname = sportname
        saveData()
    }
    
    func fetchData()
    {
        let request = NSFetchRequest<Calories>(entityName: "Consumption")
        do
        {
            Datas = try container.viewContext.fetch(request)
        }
        catch let err
        {
            print("has some error for fetchData : ", err.localizedDescription)
        }
    }
    
    func saveData()
    {
        do
        {
            try self.container.viewContext.save()
            fetchData()
        }
        catch let err
        {
            print("has some error for saveData: ",err.localizedDescription)
        }
        
    }
    
    func deleteData(IndexSet : IndexSet)
    {
        guard let index = IndexSet.first else
        {
            return
        }
        let entity = Datas[index]
        container.viewContext.delete(entity)
        saveData()
    }
}
