//
//  ViewController.swift
//  AviTask
//
//  Created by Otto Dzhandzhuliya on 31.01.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainView = MainView()
    var employerArray = [Employee]()
    var companyName: String = ""
    let name: String = ""
    var phoneNumber: String = ""
    let skills: [String] = [""]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        
      getData { [weak self] values in
         DispatchQueue.main.async {
                guard let self else {return}
                self.employerArray = values
                let sortedArray = self.employerArray.sorted(by: {$0.name < $1.name})
                self.employerArray = sortedArray
                self.mainView.tableView.reloadData()
            }
        }
    }
}

func getData(completion: @escaping ([Employee]) -> Void) {
    let urlString =  "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
    guard let url = URL(string: urlString) else { return }
    URLSession.shared.dataTask(with: url) { data,response,error in
        if let error = error {
            print(error)
            return
        }
        guard let data = data else {return}
        do {
            let res = JSONDecoder()
            let insult = try res.decode(AVITask.self, from: data)
            completion(insult.company.employees)
        } catch {
            print(error)
        }
    }.resume()
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        employerArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.reuseId, for: indexPath) as! MainCell
        let employer = employerArray[indexPath.row]
        cell.name.text = employer.name
        cell.phoneNumber.text = employer.phoneNumber
        cell.skills.text = employer.skills.joined(separator: " , ")
        return cell
    }
}
