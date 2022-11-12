//
//  NoteCell.swift
//  pvvyaltsevHW3
//
//  Created by Павел Вяльцев on 08.11.2022.
//

import UIKit

class NoteCell: UITableViewCell {
    static let reuseIdentifier = "NoteCell"
    var textView = UITextView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        textView.font = .systemFont(ofSize: 18, weight: .semibold)
        textView.setHeight(to: 140)
        textView.backgroundColor = .systemGray6
        contentView.addSubview(textView)
        textView.pin(to: contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(note: ShortNote){
        textView.text = note.text
        textView.isEditable = false
        textView.textColor = .systemGray
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
