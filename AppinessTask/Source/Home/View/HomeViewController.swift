//
//  HomeViewController.swift
//  AppinessTask
//
//  Created by mobiotics1067 on 22/09/20.
//  Copyright © 2020 Private. All rights reserved.
//

import UIKit
import Foundation

class HomeViewController: UIViewController {
    
    @IBOutlet weak var numberTbl: UITableView!
    let viewModel: HomeViewModel = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromViewModel()
}
    func getDataFromViewModel(){
        viewModel.getDataFromJson()
        numberTbl.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.notLeapModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "\(viewModel.notLeapModel?[indexPath.row].name ?? "")\n\(viewModel.notLeapModel?[indexPath.row].dob ?? "")"
        return cell
    }
    
    
}
