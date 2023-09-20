//
//  ViewController.swift
//  iOS_UIScreen
//
//  Created by Bauyrzhan Seidazymov on 11.09.2023.
//

import UIKit
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    let travel:[Travel] = [Travel(title: "ABU DHABI", image: "image1"),Travel(title: "SAN ANTONIO", image: "image2"),Travel(title: "ABU DHABI", image: "image3")]
    let firstLabel = UILabel()
    let secondLabel = UILabel()
    let thirdLabel = UILabel()
    let tableView = UITableView()
    let searchBar = UISearchBar()
    let titleTextField = UITextField()
    let buttonContainerView = UIView()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        labelConfigure()
        textFieldConfigure()
        tabelViewConfigure()
    }
    
    func labelConfigure() {
        view.addSubview(firstLabel)
        
        firstLabel.text = "Путешествуйте"
        firstLabel.font = UIFont(name: "NotoSans-SemiBold", size: 24)
        firstLabel.textColor = .black
        firstLabel.textAlignment = .center
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 14),
            firstLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(secondLabel)
        secondLabel.text = "Почувствуйте прилив энергии"
        secondLabel.font = UIFont(name: "NotoSans-SemiBold", size: 24)
        secondLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        secondLabel.textAlignment = .center
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 0),
            secondLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(thirdLabel)
        thirdLabel.text = "Мы поможем вам исследовать, сравнить и забронировать впечатления - все в одном месте."
        thirdLabel.font = UIFont(name: "NotoSans-Regular", size: 14)
        thirdLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        thirdLabel.textAlignment = .center
        thirdLabel.translatesAutoresizingMaskIntoConstraints = false
        thirdLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            thirdLabel.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 11),
            thirdLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            thirdLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }
    
    func textFieldConfigure(){
        view.addSubview(titleTextField)
        titleTextField.placeholder = "Куда хотите поехать?"
        titleTextField.borderStyle = .roundedRect
        titleTextField.backgroundColor = .white
        titleTextField.tintColor = UIColor(red: 194, green: 194, blue: 194, alpha: 1)
        titleTextField.layer.shadowColor = UIColor.black.cgColor
        titleTextField.layer.shadowOffset = CGSize(width: 0, height: 1)
        titleTextField.layer.shadowOpacity = 0.25
        titleTextField.layer.shadowRadius = 3
        titleTextField.layer.masksToBounds = false
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 27, height: 16))
        titleTextField.leftView = leftPaddingView
        titleTextField.leftViewMode = .always
        
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "NotoSans", size: 12) ?? UIFont.systemFont(ofSize: 12),
            .foregroundColor: UIColor(red: 47/255, green: 134/255, blue: 249/255, alpha: 1),
            .kern: 0,
            .paragraphStyle: {
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.alignment = .left
                paragraphStyle.lineHeightMultiple = 12 / 16
                return paragraphStyle
            }()
        ]
        
        let attributedPlaceholder = NSAttributedString(string: "Куда хотите поехать?", attributes: placeholderAttributes)
        titleTextField.attributedPlaceholder = attributedPlaceholder
        
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: thirdLabel.bottomAnchor, constant: 10),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            titleTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        buttonContainerView.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.addSubview(buttonContainerView)
        
        NSLayoutConstraint.activate([
            buttonContainerView.topAnchor.constraint(equalTo: titleTextField.topAnchor),
            buttonContainerView.bottomAnchor.constraint(equalTo: titleTextField.bottomAnchor),
            buttonContainerView.trailingAnchor.constraint(equalTo: titleTextField.trailingAnchor),
            buttonContainerView.widthAnchor.constraint(equalToConstant: 45)
        ])
        
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        let buttonImage = UIImage(named: "searchImage")
        button.setImage(buttonImage, for: .normal)
        buttonContainerView.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: buttonContainerView.topAnchor, constant: 12),
            button.trailingAnchor.constraint(equalTo: buttonContainerView.trailingAnchor),
            button.leadingAnchor.constraint(equalTo: buttonContainerView.leadingAnchor)
        ])
        
        titleTextField.rightView = buttonContainerView
        titleTextField.rightViewMode = .always
    }
    
    func tabelViewConfigure() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -52),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        let cellImageView = UIImageView()
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(cellImageView)
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "NotoSans-Bold", size: 24)
        label.textColor = .white
        cell.contentView.addSubview(label)
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        cell.contentView.addSubview(view)
        
        NSLayoutConstraint.activate([
            cellImageView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 28),
            cellImageView.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: 0),
            cellImageView.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: 0),
            cellImageView.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 0),
            cellImageView.widthAnchor.constraint(equalToConstant: 354),
            cellImageView.heightAnchor.constraint(equalToConstant: 230)
        ])
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: cell.topAnchor, constant: 37),
            label.centerXAnchor.constraint(equalTo: cell.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 0),
            view.widthAnchor.constraint(equalToConstant: 136),
            view.heightAnchor.constraint(equalToConstant: 1),
            view.centerXAnchor.constraint(equalTo: cell.centerXAnchor)
        ])
        
        cellImageView.image = UIImage(named: travel[indexPath.row].image)
        label.text = travel[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
}



