//
//  ViewController.swift
//  KeepTruckinAssignment
//
//  Created by Deepakraj Murugesan on 15/08/21.
//

import UIKit

class SearchViewController: UIViewController {
    //MARK:- Properties of VC
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var noResultsSearchView: UIView!
    @IBOutlet weak var resultsSearchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButtonOutlet: UIButton!
    @IBOutlet weak var noResultsSearchText: UILabel!
    @IBOutlet weak var headerText: UILabel!
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var clearButtonOutlet: UIButton!
    var searchString: String?
    let pageViewModel = PageViewModel()
    
    var viewModels: [SearchResultViewModel]? = nil{
        didSet{
            self.reloadTableView()
        }
    }
    
    //MARK:- VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initializeVC()
    }
    
    //MARK:- Initialize and setup UI
    fileprivate func initializeVC(){
        self.nibRegistering()
        self.setSearchView()
        self.resetVC()
    }
    
    //MARK:- TableView Setting
    fileprivate func reloadTableView(){
        self.resultsSearchView.isHidden = false
        self.searchTableView.isHidden = false
        self.noResultsSearchView.isHidden = true

        self.searchTableView.delegate = self
        self.searchTableView.dataSource = self
        self.searchTableView.reloadData()
    }
    
    //MARK:- RESET's VC
    fileprivate func resetVC(){
        clearButtonOutlet.isHidden = true
        searchString = nil
        searchTextField.text = searchString
        searchTextField.resignFirstResponder()
        self.viewModels?.removeAll()
        self.resultsSearchView.isHidden = true
        self.searchTableView.isHidden = true
        self.noResultsSearchView.isHidden = false
        self.noResultsSearchText.attributedText = pageViewModel.componentNoSearchText
    }
    
    //MARK:- IB Actions
    @IBAction func searchAction(_ sender: Any) {
        self.fetchDataFromVM()
    }
    
    @IBAction func clearButtonAction(_ sender: Any) {
        resetVC()
    }
    
    //MARK:- Fetch DATA from ViewModel
    fileprivate func fetchDataFromVM(){
        searchString = searchTextField.text
        self.view.endEditing(true)
        if let textFieldText = searchTextField.text, textFieldText.isEmpty{
            searchString = nil
        }
        
        if let searchString = searchString, !searchString.isEmpty{
            self.view.showLoader()
            pageViewModel.getSearchResults(searchString) { (viewModels, error) in
                self.view.removeloader()
                self.viewModels = viewModels
            }
        }
    }
}

//MARK:- TableView Methods
extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return autoreleasepool{ () -> UITableViewCell in
            if let viewModels = self.viewModels{
                if let cell = tableView.dequeueReusableCell(withIdentifier: ViewSearchResultLayout.className) as? ViewSearchResultLayout{
                    cell.initialize(viewModels[safe: indexPath.row])
                    cell.selectionStyle = .none
                    return cell
                }
            }
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let heightInPts = viewModels?[safe: indexPath.row]?.heightInPts{
            return heightInPts
        }
        return 0.0
    }
}

//MARK:- TextView Methods
extension SearchViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text {
            let nsString = text as NSString
            let newString = nsString.replacingCharacters(in: range,
                                                         with: string)
            if newString.count > 0{
                self.clearButtonOutlet.isHidden = false
            }else{
                self.clearButtonOutlet.isHidden = true
                resetVC()
            }
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}

//MARK:- UI Methods
extension SearchViewController{
    fileprivate func setSearchView() {
        self.setupSearchButton()
        self.setupSearchTextField()
    }
    
    fileprivate func setupSearchButton(){
        self.searchButtonOutlet.setAttributedTitle(pageViewModel.searchButtonText, for: .normal)
        self.searchButtonOutlet.layer.borderWidth = 2.0
        self.searchButtonOutlet.layer.borderColor = Helper.hexString("#b0cae3").cgColor
        self.searchButtonOutlet.layer.cornerRadius = 5.0
    }
    
    fileprivate func setupSearchTextField(){
        self.searchTextField.attributedPlaceholder = pageViewModel.componentPlaceholderText
        self.searchTextField.autocorrectionType = .no
        self.searchTextField.delegate = self
        self.clearButtonOutlet.isHidden = true
        self.addDoneButtonOnKeyboard()
    }
    
    fileprivate func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .black
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        searchTextField.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction(){
        searchTextField.resignFirstResponder()
    }
    
    
    fileprivate func nibRegistering(){
        self.searchTableView.register(UINib(nibName: ViewSearchResultLayout.className, bundle: nil), forCellReuseIdentifier: ViewSearchResultLayout.className)
    }
}
