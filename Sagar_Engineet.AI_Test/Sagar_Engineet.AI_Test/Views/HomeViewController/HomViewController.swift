//
//  HomViewController.swift
//  Sagar_Engineet.AI_Test
//
//  Created by pcq196 on 17/12/19.
//  Copyright © 2019 pcq196. All rights reserved.
//

import UIKit
import UIScrollView_InfiniteScroll

class HomViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet private weak var tableViewPost:UITableView!
    
    //MARK: - Variables
    private var arrayHints:[Hits] = []
    private var page:Int = 0
    private var haseMorePage:Bool = true;
    
    //MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareView()
        self.getPosts()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }
    
    //MARK: - Methods
    private func prepareView(){
        self.title = "No post selected."
        self.tableViewPost.addInfiniteScroll { (table) in
            table.finishInfiniteScroll()
        }
    }
    private func getPosts(page:Int = 1){
        PostController.share.getPosts(pagenumber: page) { (allposts) in
            if let hintlist = allposts.hits{
                if page == 0{
                    self.arrayHints.removeAll();
                }
                for newhint in hintlist{
                    self.arrayHints.append(newhint)
                }
                self.tableViewPost.reloadData()
                self.page = allposts.page!
                self.haseMorePage = self.page < allposts.nbPages!
                if !self.haseMorePage{
                    self.tableViewPost.removeInfiniteScroll()
                }
            }
        }
    }
    private func shownumberofpostselected(){
        let selectedpost = arrayHints.filter { (hint) -> Bool in
            return hint.isActive
        }
        self.title = "Post selected : \(selectedpost.count)"
    }
}


extension HomViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayHints.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellpost") as! CellPost
        cell.posthint = self.arrayHints[indexPath.row];
        cell.switchActiveDeactive.tag = indexPath.row
        cell.switchActiveDeactive.addTarget(self, action: #selector(activedeactivepost(sender:)), for: UIControl.Event.valueChanged)
        return cell
    }
    @objc func activedeactivepost(sender:UISwitch){
        self.arrayHints[sender.tag].isActive = !self.arrayHints[sender.tag].isActive;
        self.tableViewPost.reloadData();
        self.shownumberofpostselected()
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.arrayHints.count - 1 && self.haseMorePage{
            self.getPosts(page: self.page + 1)
        }
    }
    
}
