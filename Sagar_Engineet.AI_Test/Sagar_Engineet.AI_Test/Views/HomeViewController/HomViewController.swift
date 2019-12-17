//
//  HomViewController.swift
//  Sagar_Engineet.AI_Test
//
//  Created by pcq196 on 17/12/19.
//  Copyright © 2019 pcq196. All rights reserved.
//

import UIKit

class HomViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet private weak var tableviewposts:UITableView!
    
    //MARK: - Variables
    var arrayhints:[Hits] = []
    
    //MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareview()
        self.getposts()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }
    
    //MARK: - Methods
    private func prepareview(){
        self.title = ""
    }
    private func getposts(){
        PostController.share.getPosts { (allposts) in
            if let hints = allposts.hits{
                self.arrayhints = hints;
            }
        }
    }
}


extension HomViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayhints.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CellPost.share;
        cell.posthint = self.arrayhints[indexPath.row];
        return cell
    }
}
