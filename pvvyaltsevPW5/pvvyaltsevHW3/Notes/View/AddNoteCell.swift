//
//  AddNoteCell.swift
//  pvvyaltsevHW3
//
//  Created by Павел Вяльцев on 08.11.2022.
//

import Foundation

import UIKit

protocol AddNoteDelegate: AnyObject {
 func newNoteAdded(note: ShortNote)
}

final class AddNoteCell: UITableViewCell, UITextViewDelegate {
    static let reuseIdentifier = "AddNoteCell"
    private var textView = UITextView()
    public var addButton = UIButton()
    
    var delegate: AddNoteDelegate?
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        textView.delegate = self
        setupView()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView() {
        textView.font = .systemFont(ofSize: 14, weight: .regular)
        textView.textColor = .lightGray
        textView.backgroundColor = .clear
        textView.text = "Type smth"
        textView.setHeight(to: 140)
        addButton.setTitle("Add new note", for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        addButton.setTitleColor(.systemBackground, for: .normal)
        addButton.backgroundColor = .black
        addButton.layer.cornerRadius = 8
        addButton.setHeight(to: 44)
        addButton.addTarget(self, action: #selector(addButtonTapped(_:)),
                            for: .touchUpInside)
        addButton.isEnabled = true
        addButton.alpha = 1
        let stackView = UIStackView(arrangedSubviews: [textView, addButton])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        contentView.addSubview(stackView)
        stackView.pin(to: contentView, [.left: 16, .top: 16, .right: 16, .bottom: 16])
        contentView.backgroundColor = .systemGray6
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    @objc
    private func addButtonTapped(_ sender: UIButton) {
        if (!textView.text.isEmpty && textView.text != "Type smth"){
            delegate?.newNoteAdded(note: ShortNote(text: textView.text))
            textView.textColor = .lightGray
            textView.text = "Type smth"
        }
    }
}


