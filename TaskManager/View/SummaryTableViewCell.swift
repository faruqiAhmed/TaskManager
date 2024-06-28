//
//  SummaryTableViewCell.swift
//  TaskManager
//
//  Created by Md Omar Faruq on 28/6/24.
//

import UIKit

class SummaryTableViewCell: UITableViewCell {

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = . fill
        stackView.spacing = UIStackView.spacingUseSystem
        stackView.backgroundColor = UIColor.secondarySystemBackground
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins =
        NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        stackView.layer.cornerRadius = 12
        stackView.clipsToBounds = true
        return stackView
    }()
   
    lazy var complatedLabel: UILabel = {
       let completedLabel = UILabel()
       completedLabel.font = UIFont.boldSystemFont(ofSize: 20)
       return completedLabel
       } ()
    lazy var incomplatedLabel: UILabel = {
       let incompletedLabel = UILabel()
       incompletedLabel.font = UIFont.boldSystemFont(ofSize: 20)
       return incompletedLabel
   
    } ( )
    override init(style: UITableViewCell.CellStyle, reuseIdentifier:
      String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
    selectionStyle = . none
    stackView.addArrangedSubview(incomplatedLabel)
    stackView.addArrangedSubview(complatedLabel)
    contentView.addSubview(stackView)
    setupConstraints ()
    }
    
    func setupConstraints () {
      NSLayoutConstraint.activate([
       stackView.leadingAnchor.constraint(equalTo:contentView.leadingAnchor, constant: 16),
       stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
       stackView.trailingAnchor.constraint(equalTo:contentView.trailingAnchor, constant:-16),
       stackView.bottomAnchor.constraint(equalTo:contentView.bottomAnchor, constant: -8),
    ])
    }
    
    func configure(completed: String, incompleted: String) {
       complatedLabel.text = "✅Completed: \(completed)"
       incomplatedLabel.text = "📝TODO: \(incompleted)"
    
    }
}
