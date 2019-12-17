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
    @IBOutlet private weak var tableviewposts:UITableView!
    
    //MARK: - Variables
    private var arrayhints:[Hits] = []
    private var page:Int = 0
    private var hasemorepage:Bool = true;
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
        self.title = "No post selected."
        self.tableviewposts.addInfiniteScroll { (table) in
            table.finishInfiniteScroll()
        }
    }
    private func getposts(page:Int = 1){
        PostController.share.getPosts(pagenumber: page) { (allposts) in
            if let hintlist = allposts.hits{
                if page == 0{
                    self.arrayhints.removeAll();
                }
                for newhint in hintlist{
                    self.arrayhints.append(newhint)
                }
                self.tableviewposts.reloadData()
                self.page = allposts.page!
                self.hasemorepage = self.page < allposts.nbPages!
                if !self.hasemorepage{
                    self.tableviewposts.removeInfiniteScroll()
                }
            }
        }
    }
    private func shownumberofpostselected(){
        let selectedpost = arrayhints.filter { (hint) -> Bool in
            return hint.isActive
        }
        self.title = "Post selected : \(selectedpost.count)"
    }
}


extension HomViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayhints.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellpost") as! CellPost
        cell.posthint = self.arrayhints[indexPath.row];
        cell.switchactivedeactive.tag = indexPath.row
        cell.switchactivedeactive.addTarget(self, action: #selector(activedeactivepost(sender:)), for: UIControl.Event.valueChanged)
        return cell
    }
    @objc func activedeactivepost(sender:UISwitch){
        self.arrayhints[sender.tag].isActive = !self.arrayhints[sender.tag].isActive;
        self.tableviewposts.reloadData();
        self.shownumberofpostselected()
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.arrayhints.count - 1 && self.hasemorepage{
            self.getposts(page: self.page + 1)
        }
    }
    
}
