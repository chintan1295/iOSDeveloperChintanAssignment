//
//  HomeViewController.swift
//  ChintanGohelAssignment
//
//  Created by Chintan Gohel on 09/01/21.
//


import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblScreenTitle: UILabel!
    @IBOutlet weak var scrollPager: ScrollPager!
    @IBOutlet weak var tbView: UITableView!
    var tableData = [UserModel]()
    
    //MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customiseViewForTheme()
        self.configurePageController()
        self.configureTableInitially()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        utility.applyCornerRadius(control: imgAvatar, radius: imgAvatar.frame.height/2)
    }
    
    //MARK: Apply Theme
    
    func customiseViewForTheme() {
        utility.applyThemeShadowScreenTitle(titleLabel: lblScreenTitle, color: UIColor.darkGray, shadoRadius: 2.0, oppacity: 0.2)
    }

    func configurePageController() {
        scrollPager.delegate = self
        scrollPager.textColor = UIColor.darkGray
        scrollPager.selectedTextColor = utility.convertHexToColor(hex: AppConstant.themeColor)
        scrollPager.indicatorColor = utility.convertHexToColor(hex: AppConstant.themeColor)
        scrollPager.addSegmentsWithTitles(segmentTitles: [AppConstant.followerTitle, AppConstant.followingTitle])
    }
    
    func configureTableInitially()  {
        self.tableData = HomeDataFetcher.sharedInstance.getDataSourceForFollowers()
    }
    
    //MARK: Controller actions

    @IBAction func btnBackPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension HomeViewController : ScrollPagerDelegate {
    
    func scrollPager(scrollPager: ScrollPager, changedIndex: Int) {
        if changedIndex == 0 {
            self.tableData.removeAll()
            self.tableData = HomeDataFetcher.sharedInstance.getDataSourceForFollowers()
        } else {
            self.tableData.removeAll()
            self.tableData = HomeDataFetcher.sharedInstance.getDataSourceForFollowing()
        }
        self.tbView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        self.tbView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected IndexPath Row \(indexPath.row)")
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userModel = self.tableData[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableCell", for: indexPath) as? HomeTableCell  else {
            let cell = HomeTableCell(style: .default, reuseIdentifier: "HomeTableCell")
            return self.configureHomeTableCell(cell: cell, userModel: userModel)
        }
        return self.configureHomeTableCell(cell: cell, userModel: userModel)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // This Method used to load another page without noticing, it will append next page in advance, if getting response late then will show indicator, Currently its commented because i am not getting list of users in pages, i am getting static data from data source
    
  /*  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.section == lastSectionIndex && indexPath.row == lastRowIndex {
            if usersResponseModel.page ?? 0 < usersResponseModel.total_pages ?? 0 {
            let activityIndicator = utility.createActivityIndicator()
            activityIndicator.startAnimating()
            activityIndicator.frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 44)
            self.tbView.tableFooterView = activityIndicator
            self.tbView.tableFooterView?.isHidden = false
                self.makeAPiCallToGetData(withPage: "PageNumber")
            } else {
                self.tbView.tableFooterView = nil
            }
        }
    }*/
    
    func configureHomeTableCell(cell:HomeTableCell, userModel: UserModel) -> HomeTableCell {
        cell.selectionStyle = .none
        cell.configureCell(userModel: userModel)
        return cell
    }
}
