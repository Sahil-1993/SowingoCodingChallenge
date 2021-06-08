//
//  ProductList.swift
//  SowingoCodingChallenge
//
//  Created by Sahil Arora on 2021-05-14.
//

import UIKit


class ProductList: UIViewController {
     
    @IBOutlet weak var tableViewProductList: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var viewFilter: UIView!
    @IBOutlet weak var labelProducts: UILabel!
    @IBOutlet weak var labelFilter: UILabel!
    @IBOutlet weak var imageViewFilter: UIImageView!
    
    private var viewModel: ProductsViewModel?
    private let refreshControl:UIRefreshControl  = UIRefreshControl()
    private var isFilter:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configurePullToRefresh()
        addTapGesture()
        getProducts()
    }
}

//MARK:- Configurators
extension ProductList {
    
    func configureView(){
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        //Hiding searchBar default border
        searchBar.backgroundImage = UIImage()
        
        tableViewProductList.rowHeight =  UITableView.automaticDimension
        tableViewProductList.estimatedRowHeight = 334
        tableViewProductList.tableFooterView = UIView()
        
        //Configurig tableview header UI elements
        viewFilter.layer.borderColor = ColorCode.filterViewBorderColor.cgColor
        viewFilter.layer.borderWidth = 2.0
        viewFilter.layer.cornerRadius = 6.0
        viewFilter.clipsToBounds = true
    }
    
    //Adding Pull to refresh
    func configurePullToRefresh(){
        refreshControl.addTarget(self, action: #selector(refreshProductList), for: .valueChanged)
        tableViewProductList.addSubview(refreshControl)
    }
    
    //Adding TapGesture onto Filter Button
    func addTapGesture(){
        
        let gestureRecognizer = UITapGestureRecognizer()
        gestureRecognizer.numberOfTouchesRequired = 1
        gestureRecognizer.addTarget(self, action: #selector(didTapFilter))
        viewFilter.addGestureRecognizer(gestureRecognizer)
    }
}
//MARK:- Custom Methods
extension ProductList {
    @objc func didTapFilter(){
        if !isFilter{
            isFilter  = true
            updateFilterView(viewColor: ColorCode.filterViewColor, labelColor: .white, filterImage: Images.FilterImage!,filterCheck: isFilter)
            self.tableViewProductList.reloadData()
            labelFilter.text = FilterLabelText.filterdLabel
        }else {
            self.showAlert(message: AlertMessages.RemoveFilterMessage)
        }
    }
    
    @objc func refreshProductList(){
        isFilter  = false
        labelFilter.text  = FilterLabelText.noFilterdLabel
        updateFilterView(viewColor: .white, labelColor: ColorCode.filterViewColor, filterImage: Images.emptyFilterImage!,filterCheck: isFilter)
        refreshControl.endRefreshing()
        tableViewProductList.reloadData()
    }
    
    //Retrieve List of Products from API Endpoint
    func getProducts(){
        //API Call
        if ReachabilityManager.sharedInstance.isConnected{
            viewModel = ProductsViewModel(callback: {
                self.tableViewProductList.isHidden = false
                self.tableViewProductList.reloadData()
            })
        } else{
            self.showAlert(message: AlertMessages.InternetConnectionMessage)
        }
       
}
    //Update FilterView on tapping filter
    func updateFilterView(viewColor:UIColor, labelColor:UIColor, filterImage:UIImage,filterCheck:Bool){
        viewFilter.backgroundColor = viewColor
        labelFilter.textColor = labelColor
        imageViewFilter.image = filterImage
        viewModel?.filterProduct(isFilter: filterCheck)
    }
}
//MARK:- TableView Delegate & DataSource
extension ProductList: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getTotalProducts ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let product = viewModel?.getProductAtIndex(with: indexPath) else{return UITableViewCell()}
        
        if product.isEnlarge {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier.largerCell, for: indexPath) as? FeaturedCell else { return UITableViewCell() }
            cell.configureCell(model: product)
            cell.delegate = self
            return cell
        } else {
           guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier.smallerCell, for: indexPath) as? ProductCell else { return UITableViewCell() }
            cell.delegate = self
            cell.configureCell(model: product)
            return cell
        }
    }
}

//MARK:- SearchBarDelegate
extension ProductList:UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel?.searchProduct(searchText: searchText)
        tableViewProductList.reloadData()
    }
   
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
extension ProductList: FavouriteProduct{
    
    func getIndexPath(cell: UITableViewCell) {
        guard let indexpath = tableViewProductList.indexPath(for: cell) else { return }
        viewModel?.updateFavProductAtIndex(with: indexpath, callback: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.tableViewProductList.reloadRows(at: [indexpath], with: .none)
        })
        viewModel?.tapFavourite(indexPath:indexpath,completion: { (response) in

        })
    }
}
